// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class BusinessSection extends StatelessWidget {
//   const BusinessSection({super.key});
//
//
//   List<TextSpan> getStyledParagraph(String paragraph) {
//     // Define the words or phrases to be bold
//     List<String> boldPhrases = [
//       'Knackbe Technologies Pvt. Ltd.',
//       //'\"Nova Scotia Support Hub\"'
//     ];
//
//     // Split the paragraph into words or sentences
//     List<TextSpan> textSpans = [];
//     String remainingText = paragraph;
//
//     // Loop through all bold phrases and replace them with styled TextSpans
//     for (String phrase in boldPhrases) {
//       // Search for the phrase in the paragraph
//       int index = remainingText.indexOf(phrase);
//
//       // While the phrase is found in the remaining text
//       while (index != -1) {
//         // Add the part before the phrase
//         if (index > 0) {
//           String beforePhrase = remainingText.substring(0, index);
//           textSpans.add(TextSpan(
//             text: beforePhrase,
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.smallFontSize,
//             ),
//           ));
//         }
//
//         // Add the bold phrase
//         textSpans.add(TextSpan(
//           text: phrase,
//           style: GoogleFonts.nunito(
//             fontWeight: FontWeight.bold,
//             color: AppTheme.primaryColor,
//             fontSize: AppConstants.smallFontSize,
//           ),
//         ));
//
//         // Remove the processed part of the string
//         remainingText = remainingText.substring(index + phrase.length);
//         // Search again for the phrase in the remaining text
//         index = remainingText.indexOf(phrase);
//       }
//     }
//
//     // Add any remaining text after the last bold phrase
//     if (remainingText.isNotEmpty) {
//       textSpans.add(TextSpan(
//         text: remainingText,
//         style: GoogleFonts.nunito(
//           fontSize: AppConstants.smallFontSize,
//         ),
//       ));
//     }
//
//     return textSpans;
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust as needed
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 12),
//           Text(
//             LocalStrings.otherBusi,
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.bigFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 12),
//           // Text.rich(
//           //     TextSpan(
//           //       children: getStyledParagraph(LocalStrings.aboutpara,),
//           //     )
//           // ),
//         ],
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// import '../../../../core/app_theme/app_theme.dart';
// import '../../../../core/common_widgets/star_rating_bar_diasplay.dart';
// import '../../../../core/local/local_asstes/local_assets.dart';
//
// class RelatedBusinessSection extends StatelessWidget {
//   const RelatedBusinessSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 12),
//           Text(
//             LocalStrings.otherBusi,
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.bigFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 12),
//           const BusinessCardScreen(),
//         ],
//       ),
//     );
//   }
// }
//
// class BusinessCardScreen extends StatelessWidget {
//   const BusinessCardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           BusinessCard(
//             imagePath: LocalAssets.mehImage,
//             businessName: 'Mehndi Designs Halifax',
//             rating: 5.0,
//             description:
//                 'Transform Your Style with Organic Henna Designs. Bring the beauty of nature to your skin with our exquisite organic henna designs.',
//           ),
//           BusinessCard(
//             imagePath: LocalAssets.prImage,
//             businessName: 'Priya Choudhari - Advisor, Sun Life',
//             rating: 4.5,
//             description:
//                 'Life & Health Insurance. Investments. Invest in peace of mind—protect your loved ones with comprehensive life insurance.',
//           ),
//           BusinessCard(
//             imagePath: LocalAssets.vaImage,
//             businessName: 'Vana Boutique',
//             rating: 2.0,
//             description:
//                 'Vana Boutique, your ultimate destination for a stunning selection of traditional Indian attire. Our range features sarees, kurtas, and more.',
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BusinessCard extends StatelessWidget {
//   final String imagePath;
//   final String businessName;
//   final double rating;
//   final String description;
//
//   const BusinessCard({
//     super.key,
//     required this.imagePath,
//     required this.businessName,
//     required this.rating,
//     required this.description,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 350,
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         border:
//             Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             offset: const Offset(2, 4),
//             blurRadius: 6,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Image.asset(
//               imagePath,
//               width: 120,
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             businessName,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 6),
//           StarRatingBar(rating: rating,),
//           const SizedBox(height: 6),
//           Text(
//             description,
//             style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//           ),
//           const SizedBox(height: 12),
//           Center(
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppTheme.primaryColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//               ),
//               child: const Text(
//                 'View Business',
//                 style: TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';

import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_diasplay.dart';
import 'package:provider/provider.dart';

class RelatedBusinessSection extends StatelessWidget {
  /*List<Business> displayList;*/
  RelatedBusinessSection({super.key,/*required this.displayList*/});

  @override
  Widget build(BuildContext context) {

    //displayList.shuffle(Random());
    //var randomList = displayList.take(3).toList();


    // Get screen width from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the container width for equal distribution of items
    double containerWidth = screenWidth * 0.28;
    double containerHeight = containerWidth * 1.18;

    // Dynamic image dimensions based on container size
    // double imageWidth = containerWidth * 0.9;  // 90% of the container width
    // double imageHeight = containerHeight * 0.6; // 60% of the container height

    // Determine if the screen is small and adjust layout accordingly
    bool isSmallScreen = screenWidth < 600; // Small screen threshold
    if (isSmallScreen) {
      containerWidth = screenWidth * 0.64; // Wider containers on small screens
      //imageHeight = 150; // Smaller images for small screens
      containerHeight = containerWidth * 1.2; // Adjust container height for smaller screens
    }

    return Consumer<BusinessDirectoryProvider>(
      builder: (context, value, child) {
        return Container(
          height: containerHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal,vertical: 4),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  value.relatedBusinesses.length, // Show only 3 items in a row
                      (index) => Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: BusinessListCard(business: value.relatedBusinesses[index],),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



class BusinessListCard extends StatelessWidget {
  const BusinessListCard({super.key, required this.business});

  final Business business;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;

    return Center(
      child: FittedBox(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: /*!isSmallScreen ? 448 : 500*/448, // Fixed width
          height: /*!isSmallScreen ? 448 : 550*/448, // Fixed height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      business.image,
                      width: 400,
                      height: 180,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/image_not_available_img.png',
                          width: 400,
                          height: 180,
                          fit: BoxFit.fitWidth,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        business.name,
                        style: AppConstants.nunitoMediumW500.copyWith(
                            fontSize: isSmallScreen ? 14 : 16,
                            fontWeight: FontWeight.bold
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (business.isVerified)
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Image.asset(
                          'assets/icons/verified_business_ic.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                StarRatingBar(rating: business.averageRating),
                const SizedBox(height: 6),
                Expanded(
                  child: Text(
                    business.description,
                    maxLines: 5, // Set max lines limit
                    overflow: TextOverflow.ellipsis,
                    style: AppConstants.nunitoMediumW500.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
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
        ),
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
  });

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
                  color: skeletonColor,
                ),
                child: Center(child: Text("Coming Soon", style: AppConstants.nunitoBigWhiteW700,)),
              ),
            ),
            /// business name
            Container(
              width: containerWidth * 0.4,
              height: containerWidth * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: skeletonColor,
              ),
            ),
            /// rating
            Container(
              width: containerWidth* 0.3,
              height: containerWidth * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: skeletonColor,
              ),
            ),
            /// paragraph section
            Container(
              width: containerWidth * 0.9,
              height: containerWidth * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: skeletonColor,
              ),
            ),
            Container(
              width: containerWidth * 0.9,
              height: containerWidth * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: skeletonColor,
              ),
            ),
            Container(
              width: containerWidth * 0.8,
              height: containerWidth * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: skeletonColor,
              ),
            ),
            Container(
              width: containerWidth * 0.7,
              height: containerWidth * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: skeletonColor,
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
