class ContactForm {
  String name;
  String email;
  String message;
   DateTime timestamp;

  ContactForm({
    required this.name,
    required this.email,
    required this.message,

    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'message': message,
       'timestamp': timestamp.toIso8601String(),
    };
  }
}
