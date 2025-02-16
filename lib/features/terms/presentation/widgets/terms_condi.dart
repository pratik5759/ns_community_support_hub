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

//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
//
// class termsConditionSection extends StatelessWidget {
//   const termsConditionSection({super.key});
//
//   List<TextSpan> getStyledParagraph(String paragraph) {
//     List<String> boldPhrases = [
//       '1.Acceptance of Terms',
//       '2.Platform Usage',
//       '3.Registration and Accounts',
//       '4.Business Listings',
//       '5.User Conduct',
//       '6.Reviews and Ratings',
//       '7.Intellectual Property',
//       '8.Limitation of Liability',
//       '9.Disclaimer of Warranties',
//       '10.Changes to the Terms and Conditions',
//       '11.Governing Law',
//       '12.Contact Us',
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
//
// 1. Acceptance of Terms
//
// By using the Indians Support Hub platform, you agree to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern Indians Support Hub's relationship with you. If you disagree with any part of these terms and conditions, please do not use our website or services
//
//
// 2. Platform Usage
//
// NS Support Hub is a community platform designed to help users find and connect with Indian businesses and services in Canada. The platform is provided for informational purposes only. You agree that you will use the platform responsibly and for its intended purpose
//
//
// 3. Registration and Accounts
//
// To use certain features of the platform, you may be required to register and create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. You must provide accurate and complete information during the registration process.
//
//
// 4. Business Listings
//
// Business owners can list their businesses on the platform for free. All listings must comply with applicable laws and must not contain false, misleading, or fraudulent information. Indians Support Hub reserves the right to remove any listing that violates these terms or is deemed inappropriate.
//
//
// 5. User Conduct
//
// When using Indians Support Hub, you agree to:
//
// Not use the platform for any illegal or unauthorized purpose
// Not post any content that is offensive, defamatory, or violates the rights of others.
// Not use the platform to spam, harass, or harm other users
//
//
// 6. Reviews and Ratings
//
// Indians Support Hub allows users to leave reviews and ratings for businesses listed on the platform. By submitting a review, you agree that.
//
// Your review is honest and based on your own experience.
// You will not submit any false or misleading information.
// Indians Support Hub reserves the right to remove reviews that violate these terms or are considered inappropriate.
//
//
// 7. Intellectual Property
//
// All content on Indians Support Hub, including but not limited to text, graphics, logos, and software, is the property of NS Support Hub or its licensors and is protected by applicable intellectual property laws. You may not reproduce, distribute, or otherwise use any content without our express written permission.
//
//
// 8. Limitation of Liability
//
// NS Support Hub provides the platform on an 'as is' and 'as available' basis. We do not guarantee the accuracy, completeness, or reliability of any information on the platform. NS Support Hub is not liable for any damages arising from the use of the platform or from any business transactions conducted through the platform.
//
//
//
// 9. Disclaimer of Warranties
//
// Indians Support Hub makes no warranties, expressed or implied, regarding the operation or availability of the platform, or the accuracy or reliability of the content provided. You agree that your use of the platform is at your sole risk.
//
//
//
// 10. Changes to the Terms and Conditions
//
// We may update these terms and conditions from time to time. Any changes will be posted on this page, and it is your responsibility to review the terms regularly. By continuing to use the platform after changes are posted, you agree to the revised terms.
//
//
//
// 11. Governing Law
//
// These terms and conditions are governed by and construed in accordance with the laws of Canada, and any disputes arising under these terms will be subject to the exclusive jurisdiction of the courts in Halifax, Nova Scotia.
//
//
//
// 12. Contact Us
//
// If you have any questions about these Terms and Conditions, please contact us at: support@indianssupporthub.com
//  ''';
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
//



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';

class TermsConditionSection extends StatelessWidget {
  const TermsConditionSection({super.key});

  List<TextSpan> getStyledParagraph(String paragraph) {
    List<String> boldPhrases = [
      '1. Acceptance of Terms',
      '2. Platform Usage',
      '3. Registration and Accounts',
      '4. Business Listings',
      '5. User Conduct',
      '6. Reviews and Ratings',
      '7. Intellectual Property',
      '8. Limitation of Liability',
      '9. Disclaimer of Warranties',
      '10. Changes to the Terms and Conditions',
      '11. Governing Law',
      '12. Contact Us',
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

        // Add bold phrase with a different color for the titles
        textSpans.add(TextSpan(
          text: selectedPhrase,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            fontSize: AppConstants.mediumFontSize, // Adjust title size if needed
            color: AppTheme. primaryColor, // Use a secondary theme color
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
    String termsConditionText = '''
1. Acceptance of Terms

By using the Indians Support Hub platform, you agree to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern Indians Support Hub's relationship with you. If you disagree with any part of these terms and conditions, please do not use our website or services.

2. Platform Usage

NS Support Hub is a community platform designed to help users find and connect with Indian businesses and services in Canada. The platform is provided for informational purposes only. You agree that you will use the platform responsibly and for its intended purpose.

3. Registration and Accounts

To use certain features of the platform, you may be required to register and create an account. You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. You must provide accurate and complete information during the registration process.

4. Business Listings

Business owners can list their businesses on the platform for free. All listings must comply with applicable laws and must not contain false, misleading, or fraudulent information. Indians Support Hub reserves the right to remove any listing that violates these terms or is deemed inappropriate.

5. User Conduct

When using Indians Support Hub, you agree to:
- Not use the platform for any illegal or unauthorized purpose.
- Not post any content that is offensive, defamatory, or violates the rights of others.
- Not use the platform to spam, harass, or harm other users.

6. Reviews and Ratings

Indians Support Hub allows users to leave reviews and ratings for businesses listed on the platform. By submitting a review, you agree that:
- Your review is honest and based on your own experience.
- You will not submit any false or misleading information.
- Indians Support Hub reserves the right to remove reviews that violate these terms or are considered inappropriate.

7. Intellectual Property

All content on Indians Support Hub, including but not limited to text, graphics, logos, and software, is the property of NS Support Hub or its licensors and is protected by applicable intellectual property laws. You may not reproduce, distribute, or otherwise use any content without our express written permission.

8. Limitation of Liability

NS Support Hub provides the platform on an 'as is' and 'as available' basis. We do not guarantee the accuracy, completeness, or reliability of any information on the platform. NS Support Hub is not liable for any damages arising from the use of the platform or from any business transactions conducted through the platform.

9. Disclaimer of Warranties

Indians Support Hub makes no warranties, expressed or implied, regarding the operation or availability of the platform, or the accuracy or reliability of the content provided. You agree that your use of the platform is at your sole risk.

10. Changes to the Terms and Conditions

We may update these terms and conditions from time to time. Any changes will be posted on this page, and it is your responsibility to review the terms regularly. By continuing to use the platform after changes are posted, you agree to the revised terms.

11. Governing Law

These terms and conditions are governed by and construed in accordance with the laws of Canada, and any disputes arising under these terms will be subject to the exclusive jurisdiction of the courts in Halifax, Nova Scotia.

12. Contact Us

If you have any questions about these Terms and Conditions, please contact us at: support@indianssupporthub.com
''';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          children: getStyledParagraph(termsConditionText),
        ),
      ),
    );
  }
}
