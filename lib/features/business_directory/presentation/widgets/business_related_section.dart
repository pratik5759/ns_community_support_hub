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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/common_widgets/star_rating_bar_diasplay.dart';
import '../../../../core/local/local_asstes/local_assets.dart';

class RelatedBusinessSection extends StatelessWidget {
  const RelatedBusinessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            LocalStrings.otherBusi,
            style: GoogleFonts.nunito(
              fontSize: AppConstants.bigFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const BusinessCardScreen(),
        ],
      ),
    );
  }
}

class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BusinessCard(
            imagePath: LocalAssets.mehImage,
            businessName: 'Mehndi Designs Halifax',
            rating: 5.0,
            description:
                'Transform Your Style with Organic Henna Designs. Bring the beauty of nature to your skin with our exquisite organic henna designs.',
          ),
          BusinessCard(
            imagePath: LocalAssets.prImage,
            businessName: 'Priya Choudhari - Advisor, Sun Life',
            rating: 4.5,
            description:
                'Life & Health Insurance. Investments. Invest in peace of mind—protect your loved ones with comprehensive life insurance.',
          ),
          BusinessCard(
            imagePath: LocalAssets.vaImage,
            businessName: 'Vana Boutique',
            rating: 2.0,
            description:
                'Vana Boutique, your ultimate destination for a stunning selection of traditional Indian attire. Our range features sarees, kurtas, and more.',
          ),
        ],
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  final String imagePath;
  final String businessName;
  final double rating;
  final String description;

  const BusinessCard({
    super.key,
    required this.imagePath,
    required this.businessName,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border:
            Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(2, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              imagePath,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            businessName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          StarRatingBar(rating: rating,),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'View Business',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class BusinessSection extends StatelessWidget {
//   const BusinessSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     int itemCount = AppConstants.itemLists.length > 1
//         ? AppConstants.itemLists.length - 1 // Removing last card
//         : AppConstants.itemLists.length;
//
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
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               crossAxisSpacing: 10, // Reduced spacing
//               mainAxisSpacing: 10, // Reduced spacing
//               childAspectRatio: 0.9, // Adjusted ratio for smaller cards
//             ),
//             itemCount: itemCount,
//             itemBuilder: (context, index) {
//               return BusinessCard(
//                 businessName: AppConstants.itemLists[index].imagePath,
//                 index: index,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
// class BusinessCard extends StatelessWidget {
//   const BusinessCard({
//     super.key,
//     required this.businessName,
//     required this.index,
//   });
//
//   final String businessName;
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     bool isSmallScreen = screenWidth < 600;
//
//     double containerWidth = isSmallScreen ? screenWidth * 0.8 : 250;
//     // Reduced the card height
//     double containerHeight = isSmallScreen ? 10 : 0;
//     // Reduced image height
//     double imageWidth = isSmallScreen ? containerWidth * 0.8 : 200;
//     double imageHeight = isSmallScreen ? 80 : 100; // Reduced image height
//
//     return Container(
//       width: containerWidth,
//       height: containerHeight, // Reduced height
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54.withOpacity(0.2),
//             offset: const Offset(4, 6),
//             blurRadius: 12,
//             spreadRadius: -4,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0), // Reduced padding
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Center(
//               child: Container(
//                 width: imageWidth,
//                 height: imageHeight,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   image: DecorationImage(
//                     image: AssetImage(AppConstants.itemLists[index].imagePath),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 6),
//             Text(
//               businessName,
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: isSmallScreen ? 12 : 14,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               'Capture stunning visuals for your events and projects.',
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: isSmallScreen ? 12 : 14,
//               ),
//             ),
//             const SizedBox(height: 16), // Reduced space between text and button
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//                 decoration: BoxDecoration(
//                   color: AppTheme.primaryColor,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 child: Text(
//                   LocalStrings.viewMore,
//                   style: GoogleFonts.nunito(
//                     color: Colors.white,
//                     fontSize: isSmallScreen ? 12 : AppConstants.mediumFontSize,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_diasplay.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
//
// class BusinessCard extends StatelessWidget {
//   const BusinessCard({
//     super.key,
//     required this.businessName,
//     required this.index,
//   });
//
//   final String businessName;
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     // Define breakpoints
//     bool isSmallScreen = screenWidth < 600; // Mobile screens
//     bool isMediumScreen = screenWidth >= 600 && screenWidth < 1024; // Tablets
//     bool isLargeScreen = screenWidth >= 1024; // Desktops
//
//     // Set dynamic width and height based on screen size
//     double containerWidth = isSmallScreen
//         ? screenWidth * 0.9
//         : isMediumScreen
//         ? screenWidth * 0.4
//         : 300;
//
//     double containerHeight = isSmallScreen ? 380 : 450;
//
//     double imageWidth = isSmallScreen ? containerWidth * 0.9 : 350;
//     double imageHeight = isSmallScreen ? 180 : 200;
//
//     return Container(
//       width: containerWidth,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54.withOpacity(0.3),
//             offset: const Offset(8, 12),
//             blurRadius: 24,
//             spreadRadius: -8,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min, // Adjust height based on content
//           children: [
//             Center(
//               child: Container(
//                 width: imageWidth,
//                 height: imageHeight,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image: AssetImage(AppConstants.itemLists[index].imagePath),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8), // Spacing between image and text
//             Text(
//               businessName,
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: isSmallScreen ? 14 : 16,
//               ),
//             ),
//             const StarRatingBar(rating: 5.5),
//             const SizedBox(height: 6), // Small spacing before description
//             Text(
//               'Capture the essence of life\'s moments with stunning visuals! We specialize in professional video and photography services for events, corporate projects.',
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: isSmallScreen ? 14 : 16,
//               ),
//             ),
//             const SizedBox(height: 28), // Adjust spacing before button
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                 decoration: BoxDecoration(
//                   color: AppTheme.primaryColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   LocalStrings.viewMore,
//                   style: GoogleFonts.nunito(
//                     color: Colors.white,
//                     fontSize: isSmallScreen ? 14 : AppConstants.mediumFontSize,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
