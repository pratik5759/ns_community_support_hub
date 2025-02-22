// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../features/contact_us/model/conatct_model.dart';
// //import '../models/contact_form.dart';
//
//
// import '../services/firestore_service.dart';
//
// class FirestoreService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> submitContactForm(ContactForm form) async {
//     try {
//       await _firestore.collection('contacts').add(form.toMap());
//     } catch (e) {
//       print('Error submitting form: $e');
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class ContactFormService {
  final CollectionReference contactCollection =
  FirebaseFirestore.instance.collection('contacts');

  // Submit Contact Form
  Future<void> submitContactForm(String name, String email, String message, ) async {
    try {
      await contactCollection.add({
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
      print("Error fetching contact forms: $e");
      return [];
    }
  }
}


