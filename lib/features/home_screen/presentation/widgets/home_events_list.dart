import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class HomeEventsList extends StatelessWidget {
  Widget build(BuildContext context) {
    // Get screen width from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the container width for equal distribution of items
    double containerWidth = screenWidth * 0.28; // Divide by number of items in a row (4 in this case)
    double containerHeight = containerWidth * 1.06; // Divide by number of items in a row (4 in this case)
    // double containerWidth = 480; // Divide by number of items in a row (4 in this case)
    double imageHeight = containerHeight * 0.5; // Fixed height for images on web
    double imageWidth = containerWidth; // Fixed height for images on web
    double textWidth =
        containerWidth * 0.8; // Text width proportional to the container width

    return Container(

      //height: 432,
      height: containerHeight,
      // width: screenWidth * 0.90, // Adjusted based on content
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            3, // Show only 4 items in a row
                (index) => EventsListCard(
              businessName: 'Demo Events',
              containerWidth: containerWidth,
              imageHeight: imageHeight,
              index: index,
              containerHeight: containerHeight,
              imageWidth: imageWidth,
            ),
          ),
        ),
      ),
    );
  }
}

class EventsListCard extends StatelessWidget {

  EventsListCard({
    super.key,
    required this.containerWidth,
    required this.imageHeight,
    required this.index,
    required this.containerHeight,
    required this.imageWidth,
    required this.businessName,
  });

  final String businessName;

  final double containerWidth;
  final double imageHeight;
  final double imageWidth;
  final double containerHeight;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: containerWidth,
      //height: 432,
      height: containerHeight,
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
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Center(
              child: Container(
                width: containerWidth,
                height: containerWidth * 0.5,

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
              businessName,
              //textAlign: TextAlign.center,
              style: AppConstants.nunitoMediumW500.copyWith(
                fontSize: 16, // Fixed font size for web
              ),
            ),
            Text(
              'Capture the essence of life\'s moments with stunning visuals! We specialize in professional video and photography services for events, corporate projects ',
              //textAlign: TextAlign.center,
              style: AppConstants.nunitoMediumW500.copyWith(
                fontSize: 16, // Fixed font size for web
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              width: containerWidth * 0.28,
              decoration: BoxDecoration(
                  color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      LocalStrings.viewMore,
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: AppConstants.mediumFontSize),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}