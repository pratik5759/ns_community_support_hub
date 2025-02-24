import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'dart:io' if (dart.library.html) 'dart:html' as platform;

import 'dart:async';
import 'dart:convert';
import 'dart:io' as io; // For File
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'dart:html'
    as html; // TODO: removed this comment during android app build
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddEventForm extends StatefulWidget {
  @override
  State<AddEventForm> createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _organizerController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Timer? _debounceTimer; // Declare the debounce timer

  double? latitude;
  double? longitude;

  XFile? _imageFile;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  String? _imageUrl;

//  LatLng? _location;
  XFile? _image;

  void _resetForm() {
    _nameController.clear();
    _organizerController.clear();
    _locationController.clear();
    _descriptionController.clear();

    setState(() {
      _selectedDate = null; // Reset the date
    });

    _formKey.currentState?.reset(); // Reset the form validation state
  }

  void _clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

  Future<void> _pickImageAndroid() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<void> _pickImageWeb() async {
    final html.FileUploadInputElement uploadInput =
        html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) async {
      final files = uploadInput.files;
      if (files!.isEmpty) return;

      final file = files[0];
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);

      reader.onLoadEnd.listen((e) async {
        final data = reader.result as Uint8List?;
        if (data == null) return;
        setState(() {
          _imageFile = XFile.fromData(data, name: file.name);
        });
      });
    });
  }

  Future<Map<String, double>?> getLatLongFromAddress(String address) async {
    //  final String url = 'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$apiKey';
    const String apiKey = 'AIzaSyD2wfPAi8BqN1_p9NB2ej5-gRxS-CY80PE';
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=${_locationController.text}&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final location = data['results'][0]['geometry']['location'];
          final double lat = location['lat'];
          final double lng = location['lng'];
          return {'latitude': lat, 'longitude': lng};
        } else {
          print("Failed to get coordinates: ${data['status']}");
          return null;
        }
      } else {
        print("Failed to fetch data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  void _onAddressChanged(String address) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(Duration(seconds: 2), () async {
      if (address.isNotEmpty) {
        final coords = await getLatLongFromAddress(address);
        if (coords != null) {
          setState(() {
            latitude = coords['latitude'];
            longitude = coords['longitude'];
          });
          print("Latitude: $latitude, Longitude: $longitude");
        } else {
          print("Failed to fetch coordinates");
        }
      }
    });
  }

  Future<String> _uploadImage() async {
    if (_imageFile == null) return '';

    try {
      // Define Firebase Storage reference
      final storageRef = FirebaseStorage.instance.ref().child(
            'community_events/${DateTime.now().toIso8601String()}',
          );

      UploadTask uploadTask;

      if (kIsWeb) {
        // Web: Upload as bytes
        final bytes = await _imageFile!.readAsBytes();
        final metadata = SettableMetadata(
          contentType: 'image/${_imageFile!.path.split('.').last}',
        );
        uploadTask = storageRef.putData(bytes, metadata);
      } else {
        // Mobile: Upload as file
        final file = File(_imageFile!.path);
        final metadata = SettableMetadata(
          contentType: 'image/${_imageFile!.path.split('.').last}',
        );
        uploadTask = storageRef.putFile(file, metadata);
      }

      // Wait for upload to complete
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading image: $e');
      }
      return '';
    }
  }

  //
  //
  // Future<String> _uploadImage() async {
  //   if (_imageFile == null) return '';
  //
  //   try {
  //     final storageRef = FirebaseStorage.instance.ref().child('${Constant.firebaseCommunityEvent}/${DateTime.now().toIso8601String()}');
  //     final uploadTask = kIsWeb
  //         ? storageRef.putData((await _imageFile!.readAsBytes()), SettableMetadata(contentType: 'image/${_imageFile!.path.split('.').last}'))
  //         : storageRef.putFile(File(_imageFile!.path), SettableMetadata(contentType: 'image/${_imageFile!.path.split('.').last}'));
  //
  //     final snapshot = await uploadTask.whenComplete(() {});
  //     final imageUrl = await snapshot.ref.getDownloadURL();
  //     return imageUrl;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error uploading image: $e');
  //     }
  //     return '';
  //   }
  // }
  //

  Future<void> _uploadEvent() async {
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please select a date')));
      return;
    }

    String name = _nameController.text;
    String organizer = _organizerController.text;
    String location = _locationController.text;
    String description = _descriptionController.text;

    if (name.isEmpty ||
        organizer.isEmpty ||
        location.isEmpty ||
        description.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('All fields are required')));
      return;
    }

    String latLongString = "$latitude, $longitude";
    try {
      await FirebaseFirestore.instance.collection('events').add({
        'name': name,
        'organizer': organizer,

        "location": "Latitude: $latitude, Longitude: $longitude",

        'description': description,
        'date': _selectedDate!.toIso8601String(), // Safe null check
        'timestamp': Timestamp.now(),
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Event added successfully')));

      _resetForm(); // Reset form after success
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  // Future<void> uploadEvent() async {
  //   if (_formKey.currentState == null || !_formKey.currentState!.validate()) return;
  //
  //   if (_nameController.text.isEmpty ||
  //       _descriptionController.text.isEmpty ||
  //       _dateController.text.isEmpty ||
  //       _locationController.text.isEmpty ||
  //       _organizerController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Please fill all required fields")),
  //     );
  //     return;
  //   }
  //
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   try {
  //     String imageUrl = '';
  //     if (_imageFile != null) {
  //       imageUrl = await _uploadImage();
  //     }
  //
  //     await FirebaseFirestore.instance.collection('events').add({
  //       'name': _nameController.text,
  //       'description': _descriptionController.text,
  //       'date': _dateController.text,
  //       'location': _locationController.text,
  //       'organizer': _organizerController.text,
  //       //'imageUrl': imageUrl,
  //       'createdAt': Timestamp.now(),
  //     });
  //
  //     // if (mounted) {
  //     //   ScaffoldMessenger.of(context).showSnackBar(
  //     //     SnackBar(content: Text("Event added successfully!")),
  //     //   );
  //     // }
  //
  //     if (mounted) {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text("Success"),
  //             content: Text("Event added successfully!"),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 child: Text("OK"),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     }
  //
  //
  //     _formKey.currentState!.reset();
  //     setState(() {
  //       _imageFile = null;
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Failed to add event: $e")),
  //       );
  //     }
  //   }
  // }

  // Future<void> _uploadEvent() async {
  //   if (_formKey.currentState!.validate()) {
  //     // Collect event details
  //     final name = _nameController.text;
  //     final description = _descriptionController.text;
  //     final date = _dateController.text;
  //     final location = _locationController.text;
  //     final organizer = _organizerController.text;
  //
  //     // Upload image to Firebase Storage if present
  //     String imageUrl = '';
  //     imageUrl = await _uploadImage();
  //
  //
  //
  //     // Create event data
  //     final event = {
  //       'name': name,
  //       'description': description,
  //       'date': date,
  //       'location': location,
  //       'imageUrl': imageUrl,
  //       'organizer': organizer,
  //     };
  //
  //     // Save event data to Firestore
  //    // await FirebaseFirestore.instance.collection(Constant.firebaseEventDatabase).add(event);
  //
  //     await FirebaseFirestore.instance.collection('events').add(event);
  //     // Navigate back to the previous screen
  //     Navigator.pop(context);
  //   }
  // }

  DateTime? _selectedDate; // Declare globally in your StatefulWidget

  Widget _buildDatePickerField(BuildContext context, String title) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: Color(0xFFF2F2F2),
            ),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                setState(() {
                  _selectedDate = pickedDate;
                });
              }
            },
            child: Text(
              _selectedDate == null
                  ? title
                  : DateFormat('yyyy-MM-dd').format(_selectedDate!),
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        bool isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1200;

        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 32, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMobile) ...[
                    const SizedBox(width: 18),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Container(
                        width: isTablet ? 350 : 434, // Reduced width
                        height: 400, // Reduced height
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/event.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                  Expanded(
                    child: Column(
                      children: [
                        _buildInputRow([
                          _buildInputField('Name', controller: _nameController),
                          _buildInputField('Organizer',
                              controller: _organizerController),
                        ]),
                        _buildInputRow([
                          _buildInputField('Description',
                              isMultiline: true,
                              controller: _descriptionController),
                          Column(
                            children: [
                              _buildInputField(
                                'Location',
                                controller: _locationController,
                                onChanged: (value) {
                                  _onAddressChanged(value);
                                },
                              ),
                              SizedBox(height: 16),
                              //   Display Latitude and Longitude
                              if (latitude != null && longitude != null) ...[
                                Text("Latitude: $latitude",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text("Longitude: $longitude",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                              SizedBox(height: 16),

                              _buildDatePickerField(context, 'Date'),
                            ],
                          ),
                        ]),
                        SizedBox(height: 16),
                        _buildAttachBusinessImage(),
                        SizedBox(height: 16),
                        _buildAddButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputRow(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            Expanded(child: children[i]),
            if (i != children.length - 1) SizedBox(width: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildInputField(
    String title, {
    bool isDropdown = false,
    bool isLink = false,
    bool isMultiline = false,
    List<String>? dropdownItems,
    TextEditingController? controller,
    Function(String)? onChanged, // Add onChanged callback
    ValueNotifier<String?>? dropdownController,
  }) {
    // If it's a dropdown
    if (isDropdown) {
      return DropdownButtonFormField<String>(
        value: dropdownController?.value,
        // Bind to the ValueNotifier
        decoration: InputDecoration(
          labelText: title,
          filled: true,
          labelStyle: GoogleFonts.nunito(color: AppTheme.textColor),
          fillColor: Color(0xFFF2F2F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),

            borderSide: BorderSide.none, // Removes the outline border
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        style: GoogleFonts.nunito(color: AppTheme.textColor, fontSize: 16),
        items: dropdownItems?.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (dropdownController != null) {
            dropdownController.value =
                newValue ?? ''; // Update the selected value
          }
        },
        hint: Text('Select $title'),
        // Customize the dropdown menu
        dropdownColor: Color(0xFFF2F2F2),
        // Change dropdown menu background color
        icon: Icon(
          Icons.arrow_drop_down,
          color:
              Color(0xFF7A6FB5), // Icon color can be customized based on theme
        ),
        elevation: 4,
        // Adds a subtle shadow to the dropdown menu
        isExpanded: true, // Expands the dropdown to fill the width
      );
    }

    // If it's a regular TextFormField
    return TextFormField(
      controller: controller,
      maxLines: isMultiline ? 3 : 1,
      decoration: InputDecoration(
        labelText: title,
        filled: true,
        fillColor: Color(0xFFF2F2F2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none, // Removes the outline border
        ),
        labelStyle: GoogleFonts.nunito(color: AppTheme.textColor),
        suffixIcon: isLink ? Icon(Icons.link, color: Color(0xFF7A6FB5)) : null,
      ),
      onChanged: onChanged, // Call onChanged when text changes
    );
  }

  Widget _buildAttachBusinessImage() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Color(0x28000000), blurRadius: 4, offset: Offset(2, 4)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Attach Event Image',
                style: GoogleFonts.nunito(
                  color: Color(0xFF695F9B),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  if (kIsWeb) {
                    // running on the web!
                    _pickImageWeb();
                  } else {
                    // NOT running on the web! You can check for additional platforms here.
                    _pickImageAndroid();
                  }
                },
                child: Icon(
                  Icons.attach_file,
                  color: Color(0xFF7A6FB5),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildAddButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xFF7A6FB5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Color(0x28000000), blurRadius: 4, offset: Offset(2, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, color: Colors.white),
          TextButton(
            onPressed: _isLoading ? null : _uploadEvent,
            child: _isLoading
                ? CircularProgressIndicator()
                : Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
          )
        ],
      ),
    );
  }
}
