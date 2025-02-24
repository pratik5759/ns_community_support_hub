/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_diasplay.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({
    super.key,
    required this.businessName,
    required this.index,
  });

  final String businessName;
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust number of columns based on screen width
    int columns = screenWidth > 1200
        ? 6 // Large screens (Desktop)
        : screenWidth > 900
        ? 4 // Medium screens (Tablet)
        : 2; // Small screens (Mobile)

    // Calculate width dynamically based on columns
    double spacingAdjustment = 16; // Adjust for margins & padding
    double containerWidth = (screenWidth / columns) - spacingAdjustment;

    // Dynamic text size based on screen width
    double titleFontSize = screenWidth > 1200 ? 16 : 14;
    double descriptionFontSize = screenWidth > 1200 ? 14 : 12;

    // Dynamic image dimensions
    double imageWidth = containerWidth * 0.9;
    double imageHeight = imageWidth * 0.6; // Maintain aspect ratio

    return Container(
      margin: const EdgeInsets.all(8.0),
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 12,
            spreadRadius: -4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: imageWidth,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(AppConstants.itemLists[index].imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Business Name
              Text(
                businessName,
                style: AppConstants.nunitoMediumW500.copyWith(
                  fontSize: titleFontSize,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),

              // Star Rating
              const StarRatingBar(rating: 5.5),

              // Description
              Text(
                'Capture the essence of life’s moments with stunning visuals!',
                style: AppConstants.nunitoMediumW500.copyWith(
                  fontSize: descriptionFontSize,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              // "View More" Button
              SizedBox(
                width: double.infinity, // Make button full width
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    LocalStrings.viewMore,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: screenWidth > 1200 ? 14 : 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_diasplay.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';


class BusinessCard extends StatelessWidget {
  const BusinessCard({
    super.key,
    required this.businessName,
    required this.index,
  });

  final String businessName;
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    bool isSmallScreen = screenWidth < 600; // Mobile screens
    bool isMediumScreen = screenWidth >= 600 && screenWidth < 1024; // Tablets
    bool isLargeScreen = screenWidth >= 1024; // Desktops

    // Set dynamic width and height based on screen size
    double containerWidth = isSmallScreen
        ? screenWidth * 0.9
        : isMediumScreen
        ? screenWidth * 0.4
        : 300;

    double containerHeight = isSmallScreen ? 380 : 450;

    double imageWidth = isSmallScreen ? containerWidth * 0.9 : 350;
    double imageHeight = isSmallScreen ? 180 : 200;

    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.3),
            offset: const Offset(8, 12),
            blurRadius: 24,
            spreadRadius: -8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Adjust height based on content
          children: [
            Center(
              child: Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(AppConstants.itemLists[index].imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between image and text
            Text(
              businessName,
              style: AppConstants.nunitoMediumW500.copyWith(
                fontSize: isSmallScreen ? 14 : 16,
              ),
            ),
            const StarRatingBar(rating: 5.5),
            const SizedBox(height: 6), // Small spacing before description
            Text(
              'Capture the essence of life\'s moments with stunning visuals! We specialize in professional video and photography services for events, corporate projects.',
              style: AppConstants.nunitoMediumW500.copyWith(
                fontSize: isSmallScreen ? 14 : 16,
              ),
            ),
            const SizedBox(height: 28), // Adjust spacing before button
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  LocalStrings.viewMore,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: isSmallScreen ? 14 : AppConstants.mediumFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*class BusinessCard extends StatelessWidget {
  const BusinessCard({
    super.key,
    required this.businessName,
    required this.index,
  });

  final String businessName;
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the container width for equal distribution of items
    double containerWidth = 300;
    //double containerHeight = containerWidth * 1.1;
    double containerHeight = 450;

    // Dynamic image dimensions based on container size
    //double imageWidth = containerWidth * 0.8;  // 90% of the container width
    double imageWidth = 350;  // 90% of the container width
    //double imageHeight = containerHeight * 0.6; // 60% of the container heightdouble imageWidth = containerWidth * 0.8;  // 90% of the container width
    double imageHeight = 200; // 60% of the container height

    // Adjust for smaller screens
    // bool isSmallScreen = screenWidth < 600;
    // if (isSmallScreen) {
    //   containerWidth = screenWidth * 0.45;
    //   imageHeight = 150;
    //   containerHeight = containerWidth * 1.2;
    // }

    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: containerWidth, // Responsive width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          const BoxShadow(
            color: Colors.black54,
            offset: Offset(8, 12),
            blurRadius: 24,
            spreadRadius: -8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Ensures Column height is based on content
          children: [
            Center(
              child: Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(AppConstants.itemLists[index].imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //const SizedBox(height: 8), // Spacing between image and text
            Text(
              businessName,
              style: AppConstants.nunitoMediumW500.copyWith(
                fontSize: 16,
              ),
            ),
            const StarRatingBar(rating: 5.5),
            //const SizedBox(height: 6), // Small spacing before description
            Text(
              'Capture the essence of life\'s moments with stunning visuals! We specialize in professional video and photography services for events, corporate projects.',
              style: AppConstants.nunitoMediumW500.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12), // Adjust spacing before button
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  LocalStrings.viewMore,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: AppConstants.mediumFontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}*/

