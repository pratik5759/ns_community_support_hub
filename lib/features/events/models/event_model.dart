import 'package:cloud_firestore/cloud_firestore.dart';

class EventsModel {
  final String id;
  final String name;
  final String description;
  final String date;
  final String location;
  final String imageUrl; // For event image
  final String organizer; // Organizer's name or contact

  EventsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.organizer,
  });

  factory EventsModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return EventsModel(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      date: data['date'],
      location: data['location'],
      imageUrl: data['imageUrl'],
      organizer: data['organizer'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'date': date,
      'location': location,
      'imageUrl': imageUrl,
      'organizer': organizer,
    };
  }
}
