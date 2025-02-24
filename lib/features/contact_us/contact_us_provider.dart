import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/services/firestore_service.dart';

class ContactUsProvider extends ChangeNotifier{
  FirestoreService _firestoreService = FirestoreService();



  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();



  void submitForm(BuildContext ctx) {
    _firestoreService.sendContactFormData(nameController.text, emailController.text, messageController.text,).then((_) {
      if (!ctx.mounted) return; // Ensure widget is still in the tree

      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully!")),
      );

      nameController.clear();
      emailController.clear();
      messageController.clear();
    }).catchError((error) {
      if (!ctx.mounted) return;

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text("Failed to submit form: $error")),
      );
    });
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your name";
    }
    if (value.trim().length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your email";
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your message";
    }
    if (value.trim().length < 10) {
      return "Message must be at least 10 characters";
    }
    return null;
  }

}