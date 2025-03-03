import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_dialouge.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/services/auth_service.dart';
import 'package:ns_community_support_hub/core/services/firestore_service.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ns_community_support_hub/core/services/models/user_model.dart';
import 'package:ns_community_support_hub/core/services/secure_storage_service.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';
import 'package:ns_community_support_hub/features/business_directory/models/category_model.dart';
import 'dart:io' as io; // For File
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '';

class BusinessDirectoryProvider extends ChangeNotifier {

  final FirestoreService _fireStoreService = FirestoreService();
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String? apiKey = AppConstants.mapApiKey; // Replace with your actual API key

  XFile? _image;
  XFile? get image => _image;
  LatLng? _location;
  bool _isLoading = false;

  bool _isHomeSearch = false;

  bool get isHomeSearch => _isHomeSearch;

  set isHomeSearch(bool value){
    _isHomeSearch = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  UserModel? _userModel;
  String? _imageUrl;

  Timer? _debounceTimer;


  double _rating = 0; // Stores the selected rating

  double get rating => _rating;

  void setRating(double value) {
    _rating = value;
    notifyListeners(); // Notify widgets using this provider
  }

  Business? _businessDetails;


  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  final workingHoursController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final websiteController = TextEditingController();
  final locationController = TextEditingController();
  //final currentStateController = TextEditingController();
  //final originStateController = TextEditingController();
  final categoryController = TextEditingController();
  final searchBarController = TextEditingController();
  final reviewController = TextEditingController();

  String? selectedCategory;
  List<CategoryModel> categories = [];


  StreamSubscription<List<Business>>? _businessSubscription; // Stores Firestore listener subscription


  @override
  void dispose() {
    nameController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    workingHoursController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
    websiteController.dispose();
    //searchBarController.dispose();
    isHomeSearch = false;
    super.dispose();
  }




  List<Business> _allBusinesses = [];
  List<Business> _displayedBusinesses = [];
  List<Business> _filteredBusinesses = [];
  List<Business> _relatedBusinesses = [];

  List<Business> get allBusinesses => _allBusinesses;
  List<Business> get displayedBusinesses => _displayedBusinesses;
  List<Business> get filteredBusinesses => _filteredBusinesses;
  List<Business> get relatedBusinesses => _relatedBusinesses;

  /// Load businesses from Firestore
  // Future<void> loadBusinesses() async {
  //   _isLoading = true;
  //   notifyListeners();
  //   _fireStoreService.getBusinesses().listen((businesses) async {
  //     _allBusinesses = businesses;
  //     _displayedBusinesses = [..._allBusinesses];
  //     notifyListeners(); // Notify UI to rebuild
  //
  //     // Fetch and update average ratings efficiently
  //     await _updateBusinessRatings();
  //   });
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }

  // Future<void> loadBusinesses() async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   _fireStoreService.getBusinesses().listen((businesses) async {
  //     _allBusinesses = businesses;
  //
  //     // Only update _displayedBusinesses if a search filter is NOT active
  //     if (searchBarController.text.isEmpty) {
  //       // No search active, show all businesses
  //       _displayedBusinesses = [..._allBusinesses];
  //     } else {
  //       // Search is active, reapply the filter
  //       filterSearchBusiness();
  //     }
  //
  //     notifyListeners(); // Notify UI to rebuild
  //
  //     // Fetch and update average ratings efficiently
  //     await _updateBusinessRatings();
  //   });
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }
  //
  // Future<void> filterSearchBusiness() async {
  //   _isLoading = true;
  //   notifyListeners();
  //   print('🔄 Loading started');
  //
  //   var filteredList = <Business>[];
  //   try {
  //     String searchString = searchBarController.text.toLowerCase();
  //     print('🔍 Searching for: "$searchString"');
  //
  //     print('📊 Total businesses before filtering: ${allBusinesses.length}');
  //
  //     filteredList = allBusinesses.where((business) {
  //       final nameMatch = business.name.toLowerCase().contains(searchString);
  //       final categoryMatch = business.category.toLowerCase().contains(searchString);
  //
  //       return nameMatch || categoryMatch;
  //     }).toList();
  //
  //     print('✅ Filtered businesses count: ${filteredList.length}');
  //
  //     _displayedBusinesses = filteredList;
  //
  //     if (filteredList.isEmpty) {
  //       print('⚠️ No results found');
  //       _displayedBusinesses = [];
  //     }
  //
  //     _isLoading = false;
  //     notifyListeners();
  //     print('✅ Loading completed');
  //
  //   } catch (e) {
  //     _isLoading = false;
  //     notifyListeners();
  //     print('❌ Error during search: ${e.toString()}');
  //   }
  // }


  Future<void> loadBusinesses() async {
    _isLoading = true;
    notifyListeners();

    // Cancel any previous Firestore subscription to prevent memory leaks
    _businessSubscription?.cancel();

    _businessSubscription = _fireStoreService.getBusinesses().listen((businesses) async {
      if (_allBusinesses != businesses) {  // Prevent unnecessary updates
        _allBusinesses = businesses;

        if (searchBarController.text.isEmpty) {
          _displayedBusinesses = [..._allBusinesses];
        } else {
          await filterSearchBusiness();
        }

        notifyListeners();
        await _updateBusinessRatings();  // Only update ratings when businesses change
      }

      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> filterSearchBusiness() async {
    _isLoading = true;
    notifyListeners();

    Future.delayed(Duration.zero, () {
      try {
        String searchString = searchBarController.text.toLowerCase();

        _displayedBusinesses = _allBusinesses.where((business) {
          final nameMatch = business.name.toLowerCase().contains(searchString);
          final categoryMatch = business.category.toLowerCase().contains(searchString);
          return nameMatch || categoryMatch;
        }).toList();

      } catch (e) {
        print('❌ Error during search: ${e.toString()}');
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    });
  }





  /// Fetch and update ratings for all businesses
  Future<void> _updateBusinessRatings() async {
    for (var business in _allBusinesses) {
      final doc = await _firebaseFirestore
          .collection(AppConstants.firebaseBusinesses)
          .doc(business.id)
          .get();

      if (doc.exists) {
        final data = doc.data();
        business.averageRating = data?['averageRating'] ?? 0.0;
      }
    }

    // Notify listeners after updating ratings
    notifyListeners();
  }




  Future<void> loadCategories() async {
    final String response = await rootBundle.loadString('assets/json/categories.json');
    final List<dynamic> data = json.decode(response);

    //return data.map((json) => CategoryModel.fromJson(json)).toList();
    categories = data.map((json) => CategoryModel.fromJson(json)).toList();
  }


  /// Load User ID from Secure Storage
  Future<void> loadUserData() async {
    _userModel = await _authService.getStoredUser();
  }


  // /// code for android build
  // Future<void> pickImageAndroid() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? pickedFile =
  //   await _picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     final file = io.File(pickedFile.path);
  //     final storageRef = FirebaseStorage.instance
  //         .ref()
  //         .child('${AppConstants.firebaseImages}/${DateTime.now().toString()}');
  //
  //     // Create metadata to specify the MIME type
  //     final metadata = SettableMetadata(
  //       contentType:
  //       'image/${file.path.split('.').last}', // Set MIME type based on file extension
  //     );
  //
  //     _isLoading = true; // Show loader
  //
  //     final uploadTask = storageRef.putFile(file, metadata);
  //
  //     try {
  //       final snapshot = await uploadTask.whenComplete(() {});
  //       final downloadUrl = await snapshot.ref.getDownloadURL();
  //
  //
  //         _imageUrl = downloadUrl;
  //         _image = pickedFile; // Update image
  //         _isLoading = false; // Hide loader
  //
  //     } catch (e) {
  //         _isLoading = false; // Hide loader on error
  //       if (kDebugMode) {
  //         print('Error uploading image: $e');
  //       }
  //     }
  //   }
  // }
  //
  // /// code used for web
  // Future<void> pickImageWeb() async {
  //   final html.FileUploadInputElement uploadInput =
  //   html.FileUploadInputElement();
  //   uploadInput.accept = 'image/*';
  //   uploadInput.click();
  //
  //   uploadInput.onChange.listen((e) async {
  //     final files = uploadInput.files;
  //     if (files!.isEmpty) return;
  //
  //     final file = files[0];
  //     final reader = html.FileReader();
  //     reader.readAsArrayBuffer(file);
  //
  //     reader.onLoadEnd.listen((e) async {
  //       final data = reader.result as Uint8List;
  //       final storageRef = FirebaseStorage.instance
  //           .ref()
  //           .child('${AppConstants.firebaseImages}/${DateTime.now().toString()}');
  //
  //       // Create metadata to specify the MIME type
  //       final metadata = SettableMetadata(
  //         contentType: file.type,
  //       );
  //
  //       _isLoading = true; // Show loader
  //
  //       final uploadTask = storageRef.putData(data, metadata);
  //
  //       try {
  //         final snapshot = await uploadTask.whenComplete(() {});
  //         final downloadUrl = await snapshot.ref.getDownloadURL();
  //           _imageUrl = downloadUrl;
  //           _image = XFile.fromData(data, name: file.name); // Update image
  //           _isLoading = false; // Hide loader
  //       } catch (e) {
  //           _isLoading = false; // Hide loader on error
  //         if (kDebugMode) {
  //           print('Error uploading image: $e');
  //         }
  //       }
  //     });
  //   });
  // }

  Future<void> pickImageAndroid() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = io.File(pickedFile.path);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('firebaseImages/${DateTime.now().toString()}');

      final metadata = SettableMetadata(
        contentType: 'image/${file.path.split('.').last}',
      );

      _isLoading = true;
      notifyListeners(); // Notify UI of loading state

      final uploadTask = storageRef.putFile(file, metadata);

      try {
        final snapshot = await uploadTask.whenComplete(() {});
        final downloadUrl = await snapshot.ref.getDownloadURL();

        _imageUrl = downloadUrl;
        _image = pickedFile;
      } catch (e) {
        if (kDebugMode) {
          print('Error uploading image: $e');
        }
      } finally {
        _isLoading = false;
        notifyListeners(); // Notify UI of state change
      }
    }
  }

  // Future<void> pickImageWeb() async {
  //   final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  //   uploadInput.accept = 'image/*';
  //   uploadInput.click();
  //
  //   uploadInput.onChange.listen((e) async {
  //     final files = uploadInput.files;
  //     if (files == null || files.isEmpty) return;
  //
  //     final file = files[0];
  //     final reader = html.FileReader();
  //     reader.readAsArrayBuffer(file);
  //
  //     reader.onLoadEnd.listen((e) async {
  //       final data = reader.result as Uint8List;
  //       final storageRef = FirebaseStorage.instance
  //           .ref()
  //           .child('firebaseImages/${DateTime.now().toString()}');
  //
  //       final metadata = SettableMetadata(contentType: file.type);
  //
  //
  //       _isLoading = true;
  //       notifyListeners(); // Notify UI of loading state
  //
  //       final uploadTask = storageRef.putData(data, metadata);
  //
  //       try {
  //         final snapshot = await uploadTask.whenComplete(() {});
  //         final downloadUrl = await snapshot.ref.getDownloadURL();
  //
  //         _imageUrl = downloadUrl;
  //         _image = XFile.fromData(data, name: file.name);
  //       } catch (e) {
  //         if (kDebugMode) {
  //           print('Error uploading image: $e');
  //         }
  //       } finally {
  //         _isLoading = false;
  //         notifyListeners(); // Notify UI of state change
  //       }
  //     });
  //   });
  // }

  Future<void> pickImageWeb() async {
    debugPrint('pickImageWeb() called');

    final html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();
    debugPrint('File picker opened');

    uploadInput.onChange.listen((e) async {
      debugPrint('File selected');

      final files = uploadInput.files;
      if (files == null || files.isEmpty) {
        debugPrint('No file selected');
        return;
      }

      final file = files[0];
      debugPrint('File name: ${file.name}, Type: ${file.type}, Size: ${file.size} bytes');

      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);

      reader.onLoadEnd.listen((e) async {
        debugPrint('File read complete');

        final data = reader.result as Uint8List;
        debugPrint('Data size: ${data.length} bytes');

        final storageRef = FirebaseStorage.instance
            .ref()
            .child('firebaseImages/${DateTime.now().toString()}');

        final metadata = SettableMetadata(contentType: file.type);
        debugPrint('Metadata set: ${metadata.contentType}');

        _isLoading = true;
        notifyListeners();
        debugPrint('Uploading started...');

        final uploadTask = storageRef.putData(data, metadata);

        try {
          final snapshot = await uploadTask.whenComplete(() {});
          debugPrint('Upload complete');

          final downloadUrl = await snapshot.ref.getDownloadURL();
          debugPrint('Download URL: $downloadUrl');

          _imageUrl = downloadUrl;
          _image = XFile.fromData(data, name: file.name);
          debugPrint('Image successfully assigned');
        } catch (e) {
          debugPrint('Error uploading image: $e');
        } finally {
          _isLoading = false;
          notifyListeners();
          debugPrint('Uploading process finished');
        }
      });
    });
  }


  void handleCategorySelection(String category,BuildContext ctx) {
    if (!categories.contains(category)) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
            content:
            Text('Category "$category" not found. Defaulting to "Other".')),
      );
    }
    categoryController.text =
    categories.contains(category) ? category : 'Other';
  }


  void onAddressChanged(String address) {
    debugPrint("on address change started !");
    // Cancel the previous Timer if it's still running
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    // Set a new Timer to wait for the user to stop typing
    _debounceTimer = Timer(Duration(milliseconds: 1000), () {
      if (address.isNotEmpty) {
        getLatLngFromAddress(address).then((latLng) {
          // Handle the LatLng result
          print('Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}');
          _location = LatLng(latLng.latitude, latLng.longitude);
        }).catchError((e) {
          // Handle error
          debugPrint(e.toString());
        });
      }
    });
  }




  Future<LatLng> getLatLngFromAddress(String address) async {
    String apiKey = AppConstants.mapApiKey; // Replace with your Google API key
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final location = data['results'][0]['geometry']['location'];
          double lat = location['lat'];
          double lng = location['lng'];
          return LatLng(lat, lng); // Return as LatLng object
        } else {
          throw Exception("Error from API: ${data['status']}");
        }
      } else {
        throw Exception("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch coordinates: $e");
    }
  }


  Future<void> onAddBusiness(BuildContext ctx) async {
    var businessId = const Uuid().v4();
    businessId = businessId + nameController.text.trim();

    var business = Business(
      id: businessId,
      name: nameController.text.toString().trim(),
      image: _imageUrl ?? 'no image uploaded',
      description: descriptionController.text.toString().trim(),
      businessHours: workingHoursController.text.toString().trim(),
      phoneNumber: phoneNumberController.text,
      webSiteLink: websiteController.text.toString().trim(),
      location: _location != null
          ? 'Lat: ${_location!.latitude}, Lng: ${_location!.longitude}'
          : '',

      address: locationController.text.toString().trim(),
      //currentState: currentStateController.text.toString().trim(),
      isVerified: false,
      category: categoryController.text.toString().trim(),
      ownerUserID: _userModel?.uid ?? '0',
      //ownerOriginState: originStateController.text.toString().trim(),
    );

    await _fireStoreService.addBusiness(business).then((value) {

     showAppDialog(ctx, 'Business Added Successfully', DialogType.success, 'Okay', () {
       ctx.pop();
     },);

      // ScaffoldMessenger.of(ctx).showSnackBar(
      //   const SnackBar(
      //       content: Text('Business added successfully!')),
      // );
      // ctx.pop();

    },);


  }

  Future<void> submitReview(BuildContext context, String businessId) async {
    if (_rating == 0.0 || reviewController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please provide a rating and review.")),
      );
      return;
    }

    try {
      SecureStorageService storageService = SecureStorageService();
      String? userName = await storageService.getUserName() ?? 'Anonymous';
      String? profilePic = await storageService.getUserProfilePic() ?? '';
      String userId = await storageService.getUserId() ?? 'unknownUser';

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference businessRef =
      firestore.collection(AppConstants.firebaseBusinesses).doc(businessId);

      // 🔹 Check if the user has already submitted a review
      QuerySnapshot existingReviews = await businessRef
          .collection(AppConstants.firebaseReviews)
          .where("userId", isEqualTo: userId)
          .get();

      bool isUpdating = existingReviews.docs.isNotEmpty;
      String reviewId = isUpdating
          ? existingReviews.docs.first.id // Use existing review ID
          : Uuid().v4(); // Create new ID if it's a new review

      Review newReview = Review(
        profilePic: profilePic,
        userName: userName,
        comment: reviewController.text,
        rating: _rating,
      );

      // 🔹 Add or update the review
      await businessRef
          .collection(AppConstants.firebaseReviews)
          .doc(reviewId)
          .set(newReview.toJson(), SetOptions(merge: true));

      // 🔹 Fetch the business document
      DocumentSnapshot businessDoc = await businessRef.get();

      if (businessDoc.exists) {
        Business business = Business.fromJson(businessDoc.data() as Map<String, dynamic>);

        int newReviewCount = business.reviewCount;
        double newAverageRating;

        if (isUpdating) {
          // 🔹 If updating, recalculate rating without changing review count
          double totalRating =
              (business.averageRating * business.reviewCount) -
                  existingReviews.docs.first["rating"] +
                  _rating;
          newAverageRating = totalRating / business.reviewCount;
        } else {
          // 🔹 If new review, increase review count
          newReviewCount += 1;
          newAverageRating =
              ((business.averageRating * business.reviewCount) + _rating) /
                  newReviewCount;
        }

        // 🔹 Update the business rating & count
        await businessRef.update({
          'averageRating': newAverageRating,
          'reviewCount': newReviewCount,
        });
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Review submitted successfully!")),
        );
      }

      // Reset fields
      _rating = 0.0;
      reviewController.clear();
      notifyListeners();
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error submitting review: $error")),
        );
      }
    }
  }




  // void fetchRelatedBusinesses(Business selectedBusiness) {
  //   _isLoading = true; // Start loading
  //   notifyListeners();
  //
  //   relatedBusinesses.clear();
  //
  //   // Filter businesses based on category, location, or rating criteria
  //   List<Business> filteredBusinesses = allBusinesses.where((business) {
  //     if (business.id == selectedBusiness.id) return false; // Skip selected business
  //
  //     bool sameCategory = business.category == selectedBusiness.category;
  //     bool sameLocation = business.location == selectedBusiness.location;
  //     bool similarRating = (business.averageRating - selectedBusiness.averageRating).abs() <= 1.0;
  //
  //     return sameCategory && (sameLocation || similarRating);
  //   }).toList();
  //
  //   // Sort by rating (highest first), considering both average rating and review count
  //   filteredBusinesses.sort((a, b) {
  //     if (b.averageRating == a.averageRating) {
  //       return b.reviewCount.compareTo(a.reviewCount); // Prioritize businesses with more reviews
  //     }
  //     return b.averageRating.compareTo(a.averageRating);
  //   });
  //
  //   // Get random top 3 businesses
  //   final random = Random();
  //   if (filteredBusinesses.length > 3) {
  //     filteredBusinesses = filteredBusinesses.sublist(0, min(5, filteredBusinesses.length)); // Pick top 5
  //     filteredBusinesses.shuffle(random); // Shuffle the top-rated ones
  //     relatedBusinesses.addAll(filteredBusinesses.take(3)); // Take 3 randomly
  //   } else {
  //     relatedBusinesses.addAll(filteredBusinesses); // If less than 3, add all
  //   }
  //
  //   _isLoading = false; // Stop loading
  //   notifyListeners();
  // }

  void fetchRelatedBusinesses(Business selectedBusiness) {
    _isLoading = true;
    notifyListeners();

    relatedBusinesses.clear();

    String selectedCategory = selectedBusiness.category.trim().toLowerCase();

    if (_allBusinesses.isEmpty) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    List<Business> filteredBusinesses = _allBusinesses.where((business) {
      if (business.id == selectedBusiness.id) return false;
      return business.category.trim().toLowerCase() == selectedCategory;
    }).toList();

    if (filteredBusinesses.isEmpty) {
      _isLoading = false;
      notifyListeners();
      return;
    }

    // Sort by rating (highest first), considering review count for tie-breaking
    filteredBusinesses.sort((a, b) {
      if (b.averageRating == a.averageRating) {
        return b.reviewCount.compareTo(a.reviewCount);
      }
      return b.averageRating.compareTo(a.averageRating);
    });

    if (filteredBusinesses.length > 3) {
      // Take the top 5 businesses
      List<Business> topBusinesses = filteredBusinesses.sublist(0, min(5, filteredBusinesses.length));

      // Shuffle and pick 3 randomly from top 5
      topBusinesses.shuffle();
      relatedBusinesses.addAll(topBusinesses.take(3));
    } else {
      relatedBusinesses.addAll(filteredBusinesses);
    }

    _isLoading = false;
    notifyListeners();
  }


  Business? get businessDetails => _businessDetails;

  /*Future<void> getBusinessById(String businessId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _businessDetails = _allBusinesses.firstWhere((business) => business.id == businessId);
    } catch (e) {
      _businessDetails = null; // Set to null if no match is found
    }
    _isLoading = false;
    notifyListeners(); // Notify listeners after updating the value
  }
*/

  void getBusinessById(String businessId) {
    _isLoading = true;
    notifyListeners();

    print('Fetching business for ID: $businessId'); // Log to browser console
    print('Current business list: ${_allBusinesses.map((b) => b.id).toList()}');
    print('Current business length: ${_allBusinesses.length}');

    try{
      _businessDetails = _allBusinesses.firstWhere(
            (b) => b.id == businessId,);
    }catch(e){
      print('Business ID $businessId not found in the list');
      _businessDetails = null; // Explicitly set null
    }


    _isLoading = false;
    notifyListeners();
  }



  void initialLoad(){
    loadBusinesses();
  }


}
