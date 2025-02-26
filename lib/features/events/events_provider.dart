import 'dart:async';

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
import 'package:ns_community_support_hub/features/business_directory/models/category_model.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';

class EventProvider extends ChangeNotifier {
  final FirestoreService _fireStoreService = FirestoreService();

  // String? apiKey = AppConstants.mapApiKey; // Replace with your actual API key

  bool _isLoading = false;

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

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  final locationController = TextEditingController();

  String? selectedCategory;
  List<CategoryModel> categories = [];

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }

  List<EventsModel> _allevents = [];
  List<EventsModel> _displayedevent = [];
  List<EventsModel> _filteredevent = [];

  List<EventsModel> get allEvents => _allevents;

  List<EventsModel> get displayedevent => _displayedevent;

  List<EventsModel> get filteredevent => _filteredevent;

  Future<void> loadEvents() async {
    debugPrint('Load Events called');
    _isLoading = true;
    notifyListeners();

    _fireStoreService.getEvents().listen((eve) async {
      _allevents = eve;

      notifyListeners(); // Notify UI to rebuild
    });

    _isLoading = false;
    notifyListeners();
  }




}
