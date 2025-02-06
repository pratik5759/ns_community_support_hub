

/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class HomeBusinessList extends StatelessWidget {
  Widget build(BuildContext context) {
    // Get screen width from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the container width for equal distribution of items
    double containerWidth = screenWidth * 0.28;
    double containerHeight = containerWidth * 1.1;

    // Dynamic image dimensions based on container size
    double imageWidth = containerWidth * 0.9;  // 90% of the container width
    double imageHeight = containerHeight * 0.6; // 60% of the container height

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
            (index) => BusinessListCard(
              businessName: 'Demo Business',
              containerWidth: containerWidth,
              imageHeight: imageHeight,
              index: index,
              containerHeight: containerHeight,
              imageWidth: imageWidth,
            ),
          ),
          // children: List.generate(
          //   3, // Show only 4 items in a row
          //   (index) => SkeletonBusinessCard(
          //     containerWidth: containerWidth,
          //     imageHeight: imageHeight,
          //     index: index,
          //     containerHeight: containerHeight,
          //     imageWidth: imageWidth,
          //   ),
          // ),
        ),
      ),
    );
  }
}

class BusinessListCard extends StatelessWidget {

  BusinessListCard({
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Center(
              child: Container(
                width: containerWidth,
                height: containerWidth * 0.5,

                decoration: BoxDecoration(
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
            StarRatingBar(rating: 5.5),
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
}*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class HomeBusinessList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        int crossAxisCount = (maxWidth ~/ 280).clamp(1, 4); // Adjust number of columns dynamically

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // Dynamic count based on screen width
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85, // Maintain aspect ratio for business cards
            ),
            itemCount: 6, // Number of business cards
            itemBuilder: (context, index) {
              return BusinessListCard(
                businessName: 'Demo Business',
                containerWidth: (maxWidth / crossAxisCount) - 32, // Dynamic width
                imageHeight: 140, // Fixed height
                index: index,
                containerHeight: 250, // Fixed height
                imageWidth: 180, // Fixed width
              );
            },
          ),
        );
      },
    );
  }
}

class BusinessListCard extends StatelessWidget {
  final String businessName;
  final double containerWidth;
  final double imageHeight;
  final double imageWidth;
  final double containerHeight;
  final int index;

  const BusinessListCard({
    super.key,
    required this.containerWidth,
    required this.imageHeight,
    required this.index,
    required this.containerHeight,
    required this.imageWidth,
    required this.businessName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(4, 8),
            blurRadius: 16,
            spreadRadius: -4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: containerWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            businessName,
            style: AppConstants.nunitoMediumW500.copyWith(fontSize: 16),
          ),
          StarRatingBar(rating: 5.5),
          Text(
            'Capture the essence of life\'s moments with stunning visuals!',
            style: AppConstants.nunitoMediumW500.copyWith(fontSize: 14),
          ),
          SizedBox(height: 6),
          Container(
            width: containerWidth * 0.6,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                LocalStrings.viewMore,
                style: GoogleFonts.nunito(color: Colors.white, fontSize: AppConstants.mediumFontSize),
              ),
            ),
          )
        ],
      ),
    );
  }
}



class SkeletonBusinessCard extends StatelessWidget {

  Color skeletonColor = Colors.grey;

  SkeletonBusinessCard({
    super.key,
    required this.containerWidth,
    required this.imageHeight,
    required this.index,
    required this.containerHeight,
    required this.imageWidth,
    //required this.businessName,
  });

  //final String businessName;

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Center(
              child: Container(
                width: containerWidth,
                height: containerWidth * 0.4,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: skeletonColor
                ),
                child: Center(child: Text("Coming Soon",style: AppConstants.nunitoBigWhiteW700,)),
              ),
            ),


            /// business name
            Container(
              width: containerWidth * 0.4,
              height: containerWidth * 0.04,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: skeletonColor
              ),
            ),

            /// rating
            Container(
              width: containerWidth* 0.3,
              height: containerWidth * 0.04,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: skeletonColor
              ),
            ),

            /// paragraph section
            Container(
              width: containerWidth * 0.9,
              height: containerWidth * 0.04,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: skeletonColor
              ),
            ),
            Container(
              width: containerWidth * 0.9,
              height: containerWidth * 0.04,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: skeletonColor
              ),
            ),
            Container(
              width: containerWidth * 0.8,
              height: containerWidth * 0.04,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: skeletonColor
              ),
            ),
            Container(
              width: containerWidth * 0.7,
              height: containerWidth * 0.04,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: skeletonColor
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              width: containerWidth * 0.28,
              height: containerWidth * 0.1,
              decoration: BoxDecoration(
                  color: skeletonColor, borderRadius: BorderRadius.circular(8)),

            )
          ],
        ),
      ),
    );
  }
}
