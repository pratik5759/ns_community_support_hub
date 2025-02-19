// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class PrivacyPolicySection extends StatelessWidget {
//   const PrivacyPolicySection({super.key});
//
//   List<TextSpan> getStyledParagraph(String paragraph) {
//     // Define phrases to be bold
//     List<String> boldPhrases = [
//       'Privacy Policy',
//       'Information We Collect',
//       'How We Use Your Information',
//       'Sharing Your Information',
//       'Data Security',
//       'Cookies and Tracking Technologies',
//       'Third-Party Links',
//       'Your Rights',
//       'Changes to This Privacy Policy',
//       'Contact Us'
//     ];
//
//     // Split the paragraph into words or sentences
//     List<TextSpan> textSpans = [];
//     String remainingText = paragraph;
//
//     for (String phrase in boldPhrases) {
//       int index = remainingText.indexOf(phrase);
//
//       while (index != -1) {
//         // Add text before the bold phrase
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
//         // Remove processed text
//         remainingText = remainingText.substring(index + phrase.length);
//         index = remainingText.indexOf(phrase);
//       }
//     }
//
//     // Add any remaining text
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
//       padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust as needed
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 12),
//           Text(
//             LocalStrings.privacyPolicyHeading, // Fetch from localization
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.bigFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text.rich(
//             TextSpan(
//               children: getStyledParagraph(LocalStrings.privacyPolicyContent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
//
// class PrivacyPolicySection extends StatelessWidget {
//   const PrivacyPolicySection({super.key});
//
//   List<TextSpan> getStyledParagraph(String paragraph) {
//     List<String> boldPhrases = [
//       'Introduction',
//       '1.Information We Collects',
//       ' ',
//       ' ',
//       ' ',
//       ' ',
//       ' ',
//       ' ',
//       ' ',
//       ' ',
//     ];
//
//     List<TextSpan> textSpans = [];
//     String remainingText = paragraph;
//
//     while (remainingText.isNotEmpty) {
//       int minIndex = remainingText.length;
//       String? selectedPhrase;
//
//       for (String phrase in boldPhrases) {
//         int index = remainingText.indexOf(phrase);
//         if (index != -1 && index < minIndex) {
//           minIndex = index;
//           selectedPhrase = phrase;
//         }
//       }
//
//       if (selectedPhrase != null && minIndex != -1) {
//         // Add normal text before the bold phrase
//         if (minIndex > 0) {
//           textSpans.add(TextSpan(
//             text: remainingText.substring(0, minIndex),
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.smallFontSize,
//               color: Colors.black87,
//             ),
//           ));
//         }
//
//         // Add bold phrase with primary color
//         textSpans.add(TextSpan(
//           text: selectedPhrase,
//           style: GoogleFonts.nunito(
//             fontWeight: FontWeight.bold,
//             fontSize: AppConstants.smallFontSize,
//             color: AppTheme.primaryColor, // Correct color application
//           ),
//         ));
//
//         // Remove processed text
//         remainingText = remainingText.substring(minIndex + selectedPhrase.length);
//       } else {
//         // Add remaining text if no more bold phrases are found
//         textSpans.add(TextSpan(
//           text: remainingText,
//           style: GoogleFonts.nunito(
//             fontSize: AppConstants.smallFontSize,
//             color: Colors.black87,
//           ),
//         ));
//         remainingText = ''; // End loop
//       }
//     }
//
//     return textSpans;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String privacyPolicyText = '''
// Introduction
//
// Welcome to our application. We value your privacy and are committed to protecting your personal data. This Privacy Policy outlines how we collect, use, and safeguard your information.
//
// 1.Information We Collect
//
// We collect various types of information to provide a seamless experience on our platform:
// Personal Information: This includes your name, email address, and phone number.
// Business Information: We collect business details like name, services offered.
// Usage Data: Details on how you interact with the platform.
// Location Data: Helps users find businesses near them.
//
// 2.How We Use Your Information
//
// Your information is used to provide and improve our services, personalize user experience, and communicate important updates.
//
// 3.Sharing Your Information
//
// We do not sell or rent your personal data. However, we may share information with trusted third-party service providers who assist us in operating our app.
//
// 4.Data Security
//
// We implement security measures to protect your personal data from unauthorized access or disclosure.
//
// 5.Cookies and Tracking Technologies
//
// We use cookies to enhance your experience, track app performance, and analyze trends.
//
// 6.Third-Party Links
//
// Our app may contain links to third-party websites. We are not responsible for their privacy practices.
//
// 7.Your Rights
//
// You have the right to access, update, or delete your personal information by contacting us.
//
// 8.Changes to This Privacy Policy
//
// We may update this policy from time to time. Please review it periodically for any changes.
//
// 9.Contact Us
//
// If you have any questions regarding this Privacy Policy, please contact us at support@example.com.
// ''';
//
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: RichText(
//         text: TextSpan(
//           children: getStyledParagraph(privacyPolicyText),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';

class PrivacyPolicySection extends StatelessWidget {
  const PrivacyPolicySection({super.key});

  List<TextSpan> getStyledParagraph(String paragraph) {
    List<String> boldPhrases = [
      'Introduction',
      '1.Information We Collect',
      '2.How We Use Your Information',
      '3.Sharing Your Information',
      '4.Data Security',
      '5.Cookies and Tracking Technologies',
      '6.Third-Party Links',
      '7.Your Rights',
      '8.Changes to This Privacy Policy',
      '9.Contact Us',
    ];

    List<TextSpan> textSpans = [];
    String remainingText = paragraph;

    while (remainingText.isNotEmpty) {
      int minIndex = remainingText.length;
      String? selectedPhrase;

      for (String phrase in boldPhrases) {
        int index = remainingText.indexOf(phrase);
        if (index != -1 && index < minIndex) {
          minIndex = index;
          selectedPhrase = phrase;
        }
      }

      if (selectedPhrase != null && minIndex != -1) {
        // Add normal text before the bold phrase
        if (minIndex > 0) {
          textSpans.add(TextSpan(
            text: remainingText.substring(0, minIndex),
            style: GoogleFonts.nunito(
              fontSize: AppConstants.smallFontSize,
              color: Colors.black87,
            ),
          ));
        }

        // Add bold phrase with primary color
        textSpans.add(TextSpan(
          text: selectedPhrase,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: AppConstants.smallFontSize,
            color: AppTheme.primaryColor, // Correct color application
          ),
        ));

        // Remove processed text
        remainingText = remainingText.substring(minIndex + selectedPhrase.length);
      } else {
        // Add remaining text if no more bold phrases are found
        textSpans.add(TextSpan(
          text: remainingText,
          style: GoogleFonts.nunito(
            fontSize: AppConstants.smallFontSize,
            color: Colors.black87,
          ),
        ));
        remainingText = ''; // End loop
      }
    }

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    String privacyPolicyText = '''
Introduction

Welcome to Indians Support Hub! At NS Support Hub, we are committed to safeguarding your privacy...

1.Information We Collect  
We collect various types of information to provide a seamless experience on our platform:  
• Personal Information: This includes your name, email address, and phone number.  
• Business Information: We collect business details like business name and services offered.  
• Usage Data: Details on how you interact with the platform.  
• Location Data: Helps users find businesses near them.  


2.How We Use Your Information

Your information is used to provide and improve our services, personalize user experience, and communicate important updates.

3.Sharing Your Information

We do not sell or rent your personal data. However, we may share information with trusted third-party service providers who assist us in operating our app.

4.Data Security

We implement security measures to protect your personal data from unauthorized access or disclosure.

5.Cookies and Tracking Technologies

We use cookies to enhance your experience, track app performance, and analyze trends.

6.Third-Party Links

Our app may contain links to third-party websites. We are not responsible for their privacy practices.

7.Your Rights

You have the right to access, update, or delete your personal information by contacting us.

8.Changes to This Privacy Policy

We may update this policy from time to time. Please review it periodically for any changes.

9.Contact Us

If you have any questions regarding this Privacy Policy, please contact us at support@example.com.
''';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          children: getStyledParagraph(privacyPolicyText),
        ),
      ),
    );
  }
}

