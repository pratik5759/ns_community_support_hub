
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';

class BusinessDetailsSection extends StatelessWidget {
  BusinessDetailsSection({super.key,required this.business});
  Business business;

  List<TextSpan> getStyledParagraph(String paragraph) {
    List<String> boldPhrases = [
      'Knackbe Technologies Pvt. Ltd.',
    ];

    List<TextSpan> textSpans = [];
    String remainingText = paragraph;

    for (String phrase in boldPhrases) {
      int index = remainingText.indexOf(phrase);

      while (index != -1) {
        if (index > 0) {
          String beforePhrase = remainingText.substring(0, index);
          textSpans.add(TextSpan(
            text: beforePhrase,
            style: GoogleFonts.nunito(
              fontSize: AppConstants.smallFontSize,
            ),
          ));
        }

        textSpans.add(TextSpan(
          text: phrase,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
            fontSize: AppConstants.smallFontSize,
          ),
        ));

        remainingText = remainingText.substring(index + phrase.length);
        index = remainingText.indexOf(phrase);
      }
    }

    if (remainingText.isNotEmpty) {
      textSpans.add(TextSpan(
        text: remainingText,
        style: GoogleFonts.nunito(
          fontSize: AppConstants.smallFontSize,
        ),
      ));
    }

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            LocalStrings.businessdPara,
            style: GoogleFonts.nunito(
              fontSize: AppConstants.bigFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          Text.rich(
            TextSpan(
              children: getStyledParagraph(
                LocalStrings.businessdsubHeading,
              ),
            ),
          ),
           SizedBox(height: 5,),
           Text.rich(
            TextSpan(
              children: getStyledParagraph(
                LocalStrings.businessPara,
              ),
            ),
          ),

          // Address Section
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(Icons.location_on,
                      color: AppTheme.primaryColor, size: 16),
                ),
                TextSpan(
                  text: " 6216 Seaforth St, Halifax, NS B3K 5C8, Canada\n",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                    fontSize: AppConstants.smallFontSize,
                  ),
                ),
              ],
            ),
          ),

          // Hours Section
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(Icons.access_time,
                      color: AppTheme.primaryColor, size: 16),
                ),
                TextSpan(
                  text: " Hours: Monday to Sunday 9 AM to 5 PM\n",
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                    fontSize: AppConstants.smallFontSize,
                  ),
                ),
              ],
            ),
          ),

          // Phone Number with Rounded Background
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.phone_in_talk, color: Colors.white, size: 14),
                   Text(
                    "5195021608",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.whiteColor,
                      fontSize: AppConstants.smallFontSize,
                    ),                  ),
                ],
              ),

            ),
          ),
    Text.rich(
    TextSpan(

    children: [

    // WidgetSpan(
    // child: Icon(Icons.access_time,
    // color: AppTheme.primaryColor, size: 16),
    // ),
      TextSpan(
        text: "Business Owner Origin State: Maharashtra",
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
          color: AppTheme.blackColor,
          fontSize: AppConstants.smallFontSize,
        ),
      ),
    ]
    )

    )
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class BusinessPara extends StatelessWidget {
//   const BusinessPara({super.key});
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
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         // Adjust as needed
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           const SizedBox(height: 12),
//           Text(
//             LocalStrings.businessdPara,
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.bigFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           // const SizedBox(height: 12),
//           // Text(
//           //   LocalStrings.businessdsubHeading,
//           //   style: GoogleFonts.nunito(
//           //     fontSize: AppConstants.bigFontSize,
//           //     fontWeight: FontWeight.bold,
//           //   ),
//           // ),
//           Text.rich(TextSpan(
//             children: getStyledParagraph(
//               LocalStrings.businessdsubHeading,
//             ),
//           )),
//           const SizedBox(height: 12),
//           Text.rich(TextSpan(
//             children: getStyledParagraph(
//               LocalStrings.businessPara,
//             ),
//           )),
//
//           Text.rich(
//             TextSpan(
//               children: [
//                 // Location
//                 WidgetSpan(
//                   child: Icon(Icons.location_on,
//                       color: AppTheme.primaryColor, size: 16),
//                 ),
//                 TextSpan(
//                   text: " 6216 Seaforth St, Halifax, NS B3K 5C8, Canada\n",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: AppTheme.primaryColor,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//
//                 // Hours
//                 WidgetSpan(
//                   child: Icon(Icons.access_time,
//                       color: AppTheme.primaryColor, size: 16),
//                 ),
//       ]
//     )
//     ),
//           Text.rich(
//                 TextSpan(
//                   text: " Hours: Monday to Sunday 9 AM to 5 PM\n",
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: AppTheme.primaryColor,
//                   ),
//                 )
//
//
//                 // Phone (with rounded background)
//                 WidgetSpan(
//                   child: Container(
//                     margin: EdgeInsets.only(top: 4, bottom: 4),
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: AppTheme.primaryColor,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.phone_in_talk,
//                             color: Colors.white, size: 14),
//                         SizedBox(width: 4),
//                         Text(
//                           "5195021608",
//                           style: TextStyle(color: Colors.white, fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//           ),
//         ]
//     )
//     );
//   }
// }

/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  List<TextSpan> getStyledParagraph(String paragraph) {
    List<String> boldPhrases = ['Knackbe Technologies Pvt. Ltd.'];

    List<TextSpan> textSpans = [];
    String remainingText = paragraph;

    while (remainingText.isNotEmpty) {
      int minIndex = remainingText.length;
      String? foundPhrase;

      for (String phrase in boldPhrases) {
        int index = remainingText.indexOf(phrase);
        if (index != -1 && index < minIndex) {
          minIndex = index;
          foundPhrase = phrase;
        }
      }

      if (foundPhrase != null) {
        if (minIndex > 0) {
          textSpans.add(TextSpan(
            text: remainingText.substring(0, minIndex),
            style: GoogleFonts.nunito(fontSize: AppConstants.smallFontSize),
          ));
        }
        textSpans.add(TextSpan(
          text: foundPhrase,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
            fontSize: AppConstants.smallFontSize,
          ),
        ));
        remainingText = remainingText.substring(minIndex + foundPhrase.length);
      } else {
        textSpans.add(TextSpan(
          text: remainingText,
          style: GoogleFonts.nunito(fontSize: AppConstants.smallFontSize),
        ));
        break;
      }
    }

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            LocalStrings.paraHeading,
            style: GoogleFonts.nunito(
              fontSize: AppConstants.bigFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(children: getStyledParagraph(LocalStrings.paragraph)),
          ),
        ],
      ),
    );
  }
}
*/
