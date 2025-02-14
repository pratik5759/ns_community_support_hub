import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class EventsCard extends StatelessWidget {
  final String eventName;
  final String description;
  final double? containerWidth;
  final double? containerHeight;
  final double? imageHeight;
  final double? imageWidth;

  EventsCard({
    super.key,
    required this.eventName,
    required this.description,
    this.containerWidth,
    this.containerHeight,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adaptive default sizing
    double defaultContainerWidth = screenWidth * 0.28;
    double defaultContainerHeight = defaultContainerWidth * 1.06;
    double defaultImageHeight = defaultContainerHeight * 0.5;
    double defaultImageWidth = defaultContainerWidth;

    // Adjust layout for small screens
    bool isSmallScreen = screenWidth < 600;
    if (isSmallScreen) {
      defaultContainerWidth = screenWidth * 0.45;
      defaultImageHeight = 150;
      defaultContainerHeight = defaultContainerWidth * 1.2;
    }

    return Container(
      margin: const EdgeInsets.all(8.0),
      width: containerWidth ?? defaultContainerWidth,
      height: containerHeight ?? defaultContainerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(8, 12),
            blurRadius: 24,
            spreadRadius: -8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: imageWidth ?? defaultImageWidth,
                height: imageHeight ?? defaultImageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/demo_event_img.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Text(
              eventName,
              style: AppConstants.nunitoMediumW500.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              description,
              style: AppConstants.nunitoMediumW500.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: (containerWidth ?? defaultContainerWidth) * 0.28,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    LocalStrings.viewMore,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: AppConstants.mediumFontSize,
                    ),
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
