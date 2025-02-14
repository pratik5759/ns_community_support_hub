class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final String authToken;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.authToken,
  });

  /// Convert UserModel to Map for storage
  Map<String, String> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'authToken': authToken,
    };
  }

  /// Create UserModel from Map (for retrieval)
  factory UserModel.fromMap(Map<String, String?> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? 'Unknown',
      email: map['email'] ?? 'No Email',
      photoUrl: map['photoUrl'] ?? '',
      authToken: map['authToken'] ?? '',
    );
  }
}
