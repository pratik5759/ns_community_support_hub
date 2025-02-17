// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// // import 'package:ns_community_support_hub/core/local/app_constants.dart';
// // import 'package:ns_community_support_hub/core/local/local_strings.dart';
// //
// // class FAQSection extends StatelessWidget {
// //   const FAQSection({super.key});
// //
// //   List<TextSpan> getStyledParagraph(String paragraph, List<String> boldPhrases) {
// //     List<TextSpan> textSpans = [];
// //     String remainingText = paragraph;
// //
// //     while (remainingText.isNotEmpty) {
// //       int minIndex = remainingText.length;
// //       String? foundPhrase;
// //
// //       for (String phrase in boldPhrases) {
// //         int index = remainingText.indexOf(phrase);
// //         if (index != -1 && index < minIndex) {
// //           minIndex = index;
// //           foundPhrase = phrase;
// //         }
// //       }
// //
// //       if (foundPhrase != null) {
// //         if (minIndex > 0) {
// //           textSpans.add(TextSpan(
// //             text: remainingText.substring(0, minIndex),
// //             style: GoogleFonts.nunito(fontSize: AppConstants.smallFontSize),
// //           ));
// //         }
// //         textSpans.add(TextSpan(
// //           text: foundPhrase,
// //           style: GoogleFonts.nunito(
// //             fontWeight: FontWeight.bold,
// //             color: AppTheme.primaryColor,
// //             fontSize: AppConstants.smallFontSize,
// //           ),
// //         ));
// //         remainingText = remainingText.substring(minIndex + foundPhrase.length);
// //       } else {
// //         textSpans.add(TextSpan(
// //           text: remainingText,
// //           style: GoogleFonts.nunito(fontSize: AppConstants.smallFontSize),
// //         ));
// //         break;
// //       }
// //     }
// //
// //     return textSpans;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     List<Map<String, String>> faqs = [
// //       {"question": "What is this app about?", "answer": "This app helps users manage their daily activities, attendance, and support tickets efficiently."},
// //       {"question": "How do I reset my password?", "answer": "Click on \"Forgot Password\" on the login screen and follow the instructions."},
// //       {"question": "How do I raise a support ticket?", "answer": "Navigate to the \"Support\" section, click \"Raise Ticket,\" and provide the necessary details."},
// //       {"question": "Can I edit my submitted attendance?", "answer": "No, but you can raise a correction request through the app."},
// //       {"question": "Is my data secure?", "answer": "Yes, we use encryption and secure protocols to protect your personal data."},
// //       {"question": "How can I check my leave balance?", "answer": "Go to the \"Leave\" section to view your available leave balance."},
// //       {"question": "How do I enable push notifications?", "answer": "You can enable notifications in the app settings under \"Notifications.\""},
// //       {"question": "Why am I not receiving notifications?", "answer": "Ensure notifications are enabled in both the app and device settings."},
// //       {"question": "Can I update my profile details?", "answer": "Yes, you can update your personal details in the \"Profile\" section."},
// //       {"question": "Who do I contact for support?", "answer": "You can contact our support team via the \"Help & Support\" section."},
// //     ];
// //
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const SizedBox(height: 12),
// //           Text(
// //             LocalStrings.faqHeading,
// //             style: GoogleFonts.nunito(
// //               fontSize: AppConstants.bigFontSize,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           const SizedBox(height: 12),
// //           Column(
// //             children: faqs.map((faq) {
// //               return Padding(
// //                 padding: const EdgeInsets.only(bottom: 8.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       faq["question"]!,
// //                       style: GoogleFonts.nunito(
// //                         fontSize: AppConstants.mediumFontSize,
// //                         fontWeight: FontWeight.bold,
// //                         color: AppTheme.primaryColor,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Text.rich(
// //                       TextSpan(
// //                         children: getStyledParagraph(faq["answer"]!, [faq["question"]!]),
// //                       ),
// //                     ),
// //                     const Divider(),
// //                   ],
// //                 ),
// //               );
// //             }).toList(),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// // import 'package:ns_community_support_hub/core/local/app_constants.dart';
// // import 'package:ns_community_support_hub/core/local/local_strings.dart';
// //
// // class FAQSection extends StatefulWidget {
// //   const FAQSection({super.key});
// //
// //   @override
// //   State<FAQSection> createState() => _FAQSectionState();
// // }
// //
// // class _FAQSectionState extends State<FAQSection> {
// //   int? expandedIndex; // Track which question is expanded
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     List<Map<String, String>> faqs = [
// //       {"question": "What is this app about?", "answer": "This app helps users manage their daily activities, attendance, and support tickets efficiently."},
// //       {"question": "How do I reset my password?", "answer": "Click on \"Forgot Password\" on the login screen and follow the instructions."},
// //       {"question": "How do I raise a support ticket?", "answer": "Navigate to the \"Support\" section, click \"Raise Ticket,\" and provide the necessary details."},
// //       {"question": "Can I edit my submitted attendance?", "answer": "No, but you can raise a correction request through the app."},
// //       {"question": "Is my data secure?", "answer": "Yes, we use encryption and secure protocols to protect your personal data."},
// //       {"question": "How can I check my leave balance?", "answer": "Go to the \"Leave\" section to view your available leave balance."},
// //       {"question": "How do I enable push notifications?", "answer": "You can enable notifications in the app settings under \"Notifications.\""},
// //       {"question": "Why am I not receiving notifications?", "answer": "Ensure notifications are enabled in both the app and device settings."},
// //       {"question": "Can I update my profile details?", "answer": "Yes, you can update your personal details in the \"Profile\" section."},
// //       {"question": "Who do I contact for support?", "answer": "You can contact our support team via the \"Help & Support\" section."},
// //     ];
// //
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const SizedBox(height: 12),
// //           Text(
// //             LocalStrings.faqHeading,
// //             style: GoogleFonts.nunito(
// //               fontSize: AppConstants.bigFontSize,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           const SizedBox(height: 12),
// //           Column(
// //             children: List.generate(faqs.length, (index) {
// //               bool isExpanded = expandedIndex == index;
// //               return GestureDetector(
// //                 onTap: () {
// //                   setState(() {
// //                     expandedIndex = isExpanded ? null : index;
// //                   });
// //                 },
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(bottom: 8.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       AnimatedSwitcher(
// //                         duration: const Duration(milliseconds: 300),
// //                         child: isExpanded
// //                             ? Text(
// //                           faqs[index]["answer"]!,
// //                           key: ValueKey(faqs[index]["answer"]),
// //                           style: GoogleFonts.nunito(
// //                             fontSize: AppConstants.mediumFontSize,
// //                             color: AppTheme.primaryColor,
// //                           ),
// //                         )
// //                             : Text(
// //                           faqs[index]["question"]!,
// //                           key: ValueKey(faqs[index]["question"]),
// //                           style: GoogleFonts.nunito(
// //                             fontSize: AppConstants.mediumFontSize,
// //                             fontWeight: FontWeight.bold,
// //                             color: AppTheme.primaryColor,
// //                           ),
// //                         ),
// //                       ),
// //                       const Divider(),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             }),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class FAQSection extends StatefulWidget {
//   const FAQSection({super.key});
//
//   @override
//   State<FAQSection> createState() => _FAQSectionState();
// }
//
// class _FAQSectionState extends State<FAQSection> {
//   int? expandedIndex; // Track which question is expanded
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> faqs = [
//       {"question": "What is this app about?", "answer": "This app helps users manage their daily activities, attendance, and support tickets efficiently."},
//       {"question": "How do I reset my password?", "answer": "Click on \"Forgot Password\" on the login screen and follow the instructions."},
//       {"question": "How do I raise a support ticket?", "answer": "Navigate to the \"Support\" section, click \"Raise Ticket,\" and provide the necessary details."},
//       {"question": "Can I edit my submitted attendance?", "answer": "No, but you can raise a correction request through the app."},
//       {"question": "Is my data secure?", "answer": "Yes, we use encryption and secure protocols to protect your personal data."},
//       {"question": "How can I check my leave balance?", "answer": "Go to the \"Leave\" section to view your available leave balance."},
//       {"question": "How do I enable push notifications?", "answer": "You can enable notifications in the app settings under \"Notifications.\""},
//       {"question": "Why am I not receiving notifications?", "answer": "Ensure notifications are enabled in both the app and device settings."},
//       {"question": "Can I update my profile details?", "answer": "Yes, you can update your personal details in the \"Profile\" section."},
//       {"question": "Who do I contact for support?", "answer": "You can contact our support team via the \"Help & Support\" section."},
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 12),
//           Text(
//             LocalStrings.faqHeading,
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.bigFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Column(
//             children: List.generate(faqs.length, (index) {
//               bool isExpanded = expandedIndex == index;
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     expandedIndex = isExpanded ? null : index;
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           leading: Icon(
//                             isExpanded
//                                 ? Icons.expand_less
//                                 : Icons.expand_more,
//                             color: AppTheme.primaryColor,
//                           ),
//                           title: Text(
//                             faqs[index]["question"]!,
//                             style: GoogleFonts.nunito(
//                               fontSize: AppConstants.mediumFontSize,
//                               fontWeight: FontWeight.bold,
//                               color: AppTheme.primaryColor,
//                             ),
//                           ),
//                           onTap: () {
//                             setState(() {
//                               expandedIndex = isExpanded ? null : index;
//                             });
//                           },
//                         ),
//                         if (isExpanded)
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Text(
//                               faqs[index]["answer"]!,
//                               style: GoogleFonts.nunito(
//                                 fontSize: AppConstants.mediumFontSize,
//                                 color: AppTheme.primaryColor,
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class FAQSection extends StatefulWidget {
//   const FAQSection({super.key});
//
//   @override
//   State<FAQSection> createState() => _FAQSectionState();
// }
//
// class _FAQSectionState extends State<FAQSection> {
//   int? expandedIndex; // Track which question is expanded
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> faqs = [
//       {"question": "What is this app about?", "answer": "This app helps users manage their daily activities, attendance, and support tickets efficiently."},
//       {"question": "How do I reset my password?", "answer": "Click on \"Forgot Password\" on the login screen and follow the instructions."},
//       {"question": "How do I raise a support ticket?", "answer": "Navigate to the \"Support\" section, click \"Raise Ticket,\" and provide the necessary details."},
//       {"question": "Can I edit my submitted attendance?", "answer": "No, but you can raise a correction request through the app."},
//       {"question": "Is my data secure?", "answer": "Yes, we use encryption and secure protocols to protect your personal data."},
//       {"question": "How can I check my leave balance?", "answer": "Go to the \"Leave\" section to view your available leave balance."},
//       {"question": "How do I enable push notifications?", "answer": "You can enable notifications in the app settings under \"Notifications.\""},
//       {"question": "Why am I not receiving notifications?", "answer": "Ensure notifications are enabled in both the app and device settings."},
//       {"question": "Can I update my profile details?", "answer": "Yes, you can update your personal details in the \"Profile\" section."},
//       {"question": "Who do I contact for support?", "answer": "You can contact our support team via the \"Help & Support\" section."},
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 12),
//           Text(
//             LocalStrings.faqHeading,
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.bigFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Column(
//             children: List.generate(faqs.length, (index) {
//               bool isExpanded = expandedIndex == index;
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     expandedIndex = isExpanded ? null : index;
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           title: Text(
//                             faqs[index]["question"]!,
//                             style: GoogleFonts.nunito(
//                               fontSize: AppConstants.mediumFontSize,
//                               fontWeight: FontWeight.bold,
//                               color: AppTheme.primaryColor,
//                             ),
//                           ),
//                           trailing: Icon(
//                             isExpanded
//                                 ? Icons.expand_less
//                                 : Icons.expand_more,
//                             color: AppTheme.primaryColor,
//                           ),
//                           onTap: () {
//                             setState(() {
//                               expandedIndex = isExpanded ? null : index;
//                             });
//                           },
//                         ),
//                         if (isExpanded)
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Text(
//                               faqs[index]["answer"]!,
//                               style: GoogleFonts.nunito(
//                                 fontSize: AppConstants.mediumFontSize,
//                                 color: AppTheme.primaryColor,
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
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
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class FAQSection extends StatefulWidget {
//   const FAQSection({super.key});
//
//   @override
//   State<FAQSection> createState() => _FAQSectionState();
// }
//
// class _FAQSectionState extends State<FAQSection> {
//   int? expandedIndex; // Track which question is expanded
//
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> faqs = [
//       {"question": "What is this app about?", "answer": "This app helps users manage their daily activities, attendance, and support tickets efficiently."},
//       {"question": "How do I reset my password?", "answer": "Click on \"Forgot Password\" on the login screen and follow the instructions."},
//       {"question": "How do I raise a support ticket?", "answer": "Navigate to the \"Support\" section, click \"Raise Ticket,\" and provide the necessary details."},
//       {"question": "Can I edit my submitted attendance?", "answer": "No, but you can raise a correction request through the app."},
//       {"question": "Is my data secure?", "answer": "Yes, we use encryption and secure protocols to protect your personal data."},
//       {"question": "How can I check my leave balance?", "answer": "Go to the \"Leave\" section to view your available leave balance."},
//       {"question": "How do I enable push notifications?", "answer": "You can enable notifications in the app settings under \"Notifications.\""},
//       {"question": "Why am I not receiving notifications?", "answer": "Ensure notifications are enabled in both the app and device settings."},
//       {"question": "Can I update my profile details?", "answer": "Yes, you can update your personal details in the \"Profile\" section."},
//       {"question": "Who do I contact for support?", "answer": "You can contact our support team via the \"Help & Support\" section."},
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 40),
//
//            LayoutBuilder(
//             builder: (context, constraints) {
//               double padding = constraints.maxWidth < 600 ? 8.0 : 16.0;
//               double fontSize = constraints.maxWidth < 600 ? AppConstants.smallFontSize : AppConstants.mediumFontSize;
//               return Column(
//                 children: List.generate(faqs.length, (index) {
//                   bool isExpanded = expandedIndex == index;
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         expandedIndex = isExpanded ? null : index;
//                       });
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: padding),
//                       child: Card(
//                         elevation: 4,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         color: isExpanded ? AppTheme.primaryColor : Colors.white, // Change background color when expanded
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ListTile(
//                               title: Text(
//                                 faqs[index]["question"]!,
//                                 style: GoogleFonts.nunito(
//                                   fontSize: fontSize,
//                                   fontWeight: FontWeight.bold,
//                                   color: isExpanded ? Colors.white : Colors.black, // Change text color when expanded
//                                 ),
//                               ),
//                               trailing: Icon(
//                                 isExpanded ? Icons.expand_less : Icons.expand_more,
//                                 color: isExpanded ? Colors.white : AppTheme.primaryColor, // Change icon color when expanded
//                               ),
//                               onTap: () {
//                                 setState(() {
//                                   expandedIndex = isExpanded ? null : index;
//                                 });
//                               },
//                             ),
//                             if (isExpanded)
//                               Padding(
//                                 padding: EdgeInsets.all(padding),
//                                 child: Text(
//                                   faqs[index]["answer"]!,
//                                   style: GoogleFonts.nunito(
//                                     fontSize: fontSize,
//                                     color: Colors.white, // Answer text color in expanded state
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  int? expandedIndex; // Track which question is expanded

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> faqs = [
      {
        "question": "What is NS support hub?",
        "answer":
            "IndiansSupport Hub is a free, centralized platform designed to connect the Indian community in Canada with local Indian businesses and services. Our goal is to simplify discovery empower entrepreneurs, and foster community connections through a user-friendly directory that celebrates our shared culture."
      },
      {
        "question": "How do I list my business on the platform?",
        "answer":
            '''Listing your business is easy and free! Simply visit our website, navigate to the "Add Business" section, fill out the required information, and submit. Your business will be added to the platform for everyone to discover.'''
      },
      {
        "question": "Are there any costs associated with using this platform?",
        "answer":
            "No, IndiansSupport Hub is a completely free service. Our mission is to support the Indian community by offering a platform where businesses can grow and thrive without any financial burden."
      },
      {
        "question": "Can I edit or update my business listing?",
        "answer":
            "Yes! After listing your business, you will receive access to a dashboard where you can update or edit your business details at any time."
      },
      {
        "question": "Who can leave reviews on business listings?",
        "answer":
            "Any registered user on the platform can leave a review. Reviews help ensure transparency and trust, allowing community members to share their experiences and help others make informed decisions."
      },
      {
        "question": "How are businesses categorized on IndiansSupport Hub?",
        "answer":
            "We categorize businesses based on their services, region, and the owner’s state of origin. For example, if you are looking for Maharashtrian food or services, you can easily find businesses run by fellow Maharashtrians, along with other categories that match your preferences."
      },
      {
        "question":
            "Can I promote cultural events or community-driven initiatives on the platform?",
        "answer":
            '''Yes! In addition to listing businesses, we encourage the promotion of local events and community initiatives. Simply visit the "Add Event" section and submit your event details for inclusion on the platform'''
      },
      {
        "question": "How do I leave a review or rating for a business?",
        "answer":
            "To leave a review, you must first create an account or log in. Once you are logged in, find the business you want to review, navigate to their listing, and submit your review or rating through the review section."
      },
      {
        "question": "Is IndiansSupport Hub available only in Canada?",
        "answer":
            "Currently, IndiansSupport Hub is focused on serving the Indian community in Canada. We may expand to other regions in the future, but our current aim is to provide a valuable resource for those within the Indian diaspora in Canada."
      },
      {
        "question":
            "How does the platform ensure the authenticity of business listings and reviews?",
        "answer":
            "We take authenticity seriously. All business listings and reviews are regularly monitored to ensure compliance with our guidelines. We also encourage users to report any suspicious or inappropriate content."
      },
      {
        "question": "Can I report a problem with a business or a listing?",
        "answer":
            "Yes. If you encounter an issue with a business or find false information in a listing, you can report it by clicking the “Report” button on the business page or contacting us at support@indianssupporthub.com."
      },
      {
        "question":
            "What should I do if I face technical issues while using the platform?",
        "answer":
            "If you face any technical issues or difficulties while using IndiansSupport Hub, feel free to contact our support team at support@indianssupporthub.com, and we will be happy to assist you."
      },
      {
        "question": "is the platform secure and how is my data protected?",
        "answer":
            "We prioritize your privacy and security. All personal information and data are protected in accordance with our Privacy Policy. We use industry-standard security measures to ensure that your information remains safe."
      },
      {
        "question":
            "How can I contact Indians Support Hub for additional support?",
        "answer":
            "If you have any further questions or need assistance, you can reach out to us through the “Contact Us” page on our website or send an email to support@indianssupporthub.com."
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              double padding = constraints.maxWidth < 600 ? 8.0 : 16.0;
              double fontSize = constraints.maxWidth < 600
                  ? AppConstants.smallFontSize
                  : AppConstants.mediumFontSize;
              // return Column(
              //   children: List.generate(faqs.length, (index) {
              //     bool isExpanded = expandedIndex == index;
              //     return Padding(
              //       padding: EdgeInsets.only(bottom: padding),
              //       child: Card(
              //         elevation: isExpanded ? 0 : 4,
              //         // Set elevation to 0 when expanded to avoid shadow
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         color: isExpanded ? AppTheme.primaryColor : Colors.white,
              //         // Change background color when expanded
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             ListTile(
              //               splashColor: Colors.transparent,
              //               title: Text(
              //                 faqs[index]["question"]!,
              //                 style: GoogleFonts.nunito(
              //                   fontSize: fontSize,
              //                   fontWeight: FontWeight.bold,
              //                   color: isExpanded
              //                       ? Colors.white
              //                       : Colors
              //                           .black, // Change text color when expanded
              //                 ),
              //               ),
              //               trailing: Icon(
              //                 isExpanded
              //                     ? Icons.expand_less
              //                     : Icons.expand_more,
              //                 color: isExpanded
              //                     ? Colors.white
              //                     : AppTheme
              //                         .primaryColor, // Change icon color when expanded
              //               ),
              //               onTap: () {
              //                 setState(() {
              //                   expandedIndex = isExpanded ? null : index;
              //                 });
              //               },
              //             ),
              //             if (isExpanded)
              //               Padding(
              //                 padding: EdgeInsets.all(padding),
              //                 child: Text(
              //                   faqs[index]["answer"]!,
              //                   style: GoogleFonts.nunito(
              //                     fontSize: fontSize,
              //                     color: Colors
              //                         .white, // Answer text color in expanded state
              //                   ),
              //                 ),
              //               ),
              //           ],
              //         ),
              //       ),
              //     );
              //   }),
              // );
              return Column(
                children: List.generate(faqs.length, (index) {
                  bool isExpanded = expandedIndex == index;
                  return Padding(
                    padding: EdgeInsets.only(bottom: padding),
                    child: Card(
                      elevation: isExpanded ? 0 : 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: isExpanded ? AppTheme.primaryColor : Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            title: Text(
                              faqs[index]["question"]!,
                              style: GoogleFonts.nunito(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: isExpanded ? Colors.white : Colors.black,
                              ),
                            ),
                            trailing: Icon(
                              isExpanded ? Icons.expand_less : Icons.expand_more,
                              color: isExpanded ? Colors.white : AppTheme.primaryColor,
                            ),
                            onTap: () {
                              setState(() {
                                expandedIndex = isExpanded ? null : index;
                              });
                            },
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: ConstrainedBox(
                              constraints: isExpanded
                                  ? BoxConstraints()
                                  : BoxConstraints(maxHeight: 0), // Collapsed state with maxHeight 0
                              child: Padding(
                                padding: EdgeInsets.all(padding),
                                child: Text(
                                  faqs[index]["answer"]!,
                                  style: GoogleFonts.nunito(
                                    fontSize: fontSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );

            },
          ),
        ],
      ),
    );
  }
}

