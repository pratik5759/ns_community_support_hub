class Business {
  final String id;
  final String name;
  final String image;
  final String description;
  final String businessHours;
  final String phoneNumber;
  final String webSiteLink;
  final String location;
  final String address;
  final bool isVerified;
  final String category;
  final String ownerUserID; // New field for the business owner's user ID
  double averageRating; // Field to store the average rating
  int reviewCount; // Add reviewCount field

  List<Review> reviews; // List of reviews

  Business({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.businessHours,
    required this.phoneNumber,
    required this.webSiteLink,
    required this.location,
    required this.address,
    required this.isVerified,
    required this.category,
    required this.ownerUserID,
    this.averageRating = 0.0,
    this.reviews = const [],
    this.reviewCount = 0,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'] ?? 'Unknown',
      name: json['name'] ?? 'Unknown',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      businessHours: json['businessHours'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      webSiteLink: json['webSiteLink'] ?? '',
      location: json['location'] ?? '',
      address: json['address'] ?? 'Unknown',
      isVerified: json['isVerified'] ?? false,
      category: json['category'] ?? 'Uncategorized',
      ownerUserID: json['ownerUserID'] ?? '', // Deserialize ownerUserID
      averageRating: (json['averageRating'] ?? 0.0).toDouble(), // Deserialize averageRating
      reviewCount: (json['reviewCount'] ?? 0), // Deserialize reviewCount
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
          .map((review) => Review.fromJson(review))
          .toList()
          : [], // Deserialize reviews
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'businessHours': businessHours,
      'phoneNumber': phoneNumber,
      'webSiteLink': webSiteLink,
      'location': location,
      'address': address,
      'isVerified': isVerified,
      'category': category,
      'ownerUserID': ownerUserID, // Serialize ownerUserID
      'averageRating': averageRating, // Serialize averageRating
      'reviewCount': reviewCount, // Serialize reviewCount
      'reviews': reviews.map((review) => review.toJson()).toList(), // Serialize reviews
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'description': description,
      'businessHours': businessHours,
      'phoneNumber': phoneNumber,
      'webSiteLink': webSiteLink,
      'location': location,
      'category': category,
      'isVerified': isVerified,
      'image': image,
      'ownerUserID': ownerUserID, // Include ownerUserID in map
      'averageRating': averageRating, // Include averageRating in map
      'reviewCount': reviewCount, // Include reviewCount in map
    };
  }
}

class Review {

  final String profilePic;
  final String userName;
  final String comment;
  final double rating;

  Review({
    required this.profilePic,
    required this.userName,
    required this.comment,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      profilePic: json['profilePic'] ?? 'Anonymous',
      userName: json['userName'] ?? 'Anonymous',
      comment: json['comment'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profilePic': profilePic,
      'userName': userName,
      'comment': comment,
      'rating': rating,
    };
  }
}
