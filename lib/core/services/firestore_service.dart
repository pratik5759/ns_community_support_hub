import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';
class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  // Method to get all businesses as a stream
  Stream<List<Business>> getBusinesses() {
    return _db.collection(AppConstants.firebaseBusinesses).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Business.fromJson(doc.data())).toList());
  }

  Stream<List<Event>> getEvents(){
    return _db.collection(AppConstants.firebaseEvents).snapshots().map((snapshot) => snapshot.docs.map((doc) => Event.fromFirestore(doc),).toList(),);
  }

  // Method to update a specific business
  Future<void> updateBusiness(Business business) async {
    final docRef = _db.collection(AppConstants.firebaseBusinesses).doc(business.id);
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      try {
        await docRef.update(business.toMap());
      } catch (e) {
        if (kDebugMode) {
          print('Error updating business: $e');
        }
        throw e;
      }
    } else {
      if (kDebugMode) {
        print('Document does not exist');
      }
    }
  }


  // Method to update a specific business
  // Future<void> updateBusiness(Business business) async {
  //   final docRef = _db.collection('businesses').doc(business.id);
  //   final docSnapshot = await docRef.get();
  //   if (docSnapshot.exists) {
  //     try {
  //       await docRef.update({
  //         'name': business.name,
  //         'description': business.description,
  //         'businessHours': business.businessHours,
  //         'phoneNumber': business.phoneNumber,
  //         'location': business.location,
  //         'currentState': business.currentState,
  //         'address': business.address,
  //         'category': business.category,
  //         'image': business.image,
  //         'isVerified': business.isVerified,
  //       });
  //     } catch (e) {
  //       print('Error updating business: $e');
  //       throw e;
  //     }
  //   } else {
  //     print('Document does not exist');
  //   }
  // }

  // Method to add a new business
  Future<void> addBusiness(Business business) async {
    try {
      await _db.collection(AppConstants.firebaseBusinesses).doc(business.id).set({
        'id': business.id,
        'name': business.name,
        'description': business.description,
        'businessHours': business.businessHours,
        'phoneNumber': business.phoneNumber,
        'webSiteLink': business.webSiteLink,
        'location': business.location,
        // 'currentState': business.currentState,
        // 'ownerOriginState': business.ownerOriginState,
        'address': business.address,
        'category': business.category,
        'image': business.image,
        'ownerUserID': business.ownerUserID,
        'isVerified': business.isVerified,
      });
    } catch (e) {


      throw e;
    }
  }


import 'package:cloud_firestore/cloud_firestore.dart';

  Future<List<String>> fetchImageUrls() async {
    try {
      final ListResult result = await _firebaseStorage.ref(AppConstants.firebaseImages).listAll();
      List<String> imageUrls = [];
      for (final item in result.items) {
        final url = await item.getDownloadURL();
        imageUrls.add(url);
      }
      return imageUrls;
    } catch (e) {

      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> fetchRelatedBusinesses(String category) async {
    try {
      final querySnapshot = await _db
          .collection(AppConstants.firebaseBusinesses)
          .where('category', isEqualTo: category)
          .get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {

      throw e;
    }
  }

  Future<void> sendContactFormData(String name, String email, String message) async {
    try {
      await _db.collection(AppConstants.firebaseContactForms).add({
        'name': name,
        'email': email,
        'message': message,
         'timestamp': FieldValue.serverTimestamp(),
      });
      print("Contact form submitted successfully!");
    } catch (e) {
      print("Error submitting form: $e");
    }
  }

  // Fetch Contact Messages
  Future<List<Map<String, dynamic>>> getContactForms() async {
    try {
      QuerySnapshot querySnapshot = await contactCollection.orderBy('timestamp', descending: true).get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      }
    }
  }

}

