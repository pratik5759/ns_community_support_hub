// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class ContactReview extends StatelessWidget {
//   const ContactReview({super.key});
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
//             LocalStrings.aboutHeading,
//             style: GoogleFonts.nunito(
//               fontSize: AppConstants.bigFontSize,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text.rich(
//               TextSpan(
//                 children: getStyledParagraph(LocalStrings.aboutpara,),
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';

import '../../../../core/services/firestore_service.dart';

class ContactReview extends StatefulWidget {
  const ContactReview({super.key});

  @override
  State<ContactReview> createState() => _ContactReviewState();
}

class _ContactReviewState extends State<ContactReview> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final ContactFormService contactFormService = ContactFormService();

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     contactFormService.submitContactForm(
  //       _nameController.text,
  //       _emailController.text,
  //       _messageController.text,
  //     ).then((_) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Form submitted successfully!")),
  //       );
  //       _nameController.clear();
  //       _emailController.clear();
  //       _messageController.clear();
  //     });
  //   }
  // }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      contactFormService
          .submitContactForm(
        _nameController.text,
        _emailController.text,
        _messageController.text,
      )
          .then((_) {
        if (!mounted) return; // Ensure widget is still in the tree

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Form submitted successfully!")),
        );

        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      }).catchError((error) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to submit form: $error")),
        );
      });
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your name";
    }
    if (value.trim().length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your email";
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? _validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter your message";
    }
    if (value.trim().length < 10) {
      return "Message must be at least 10 characters";
    }
    return null;
  }

  TextSpan getStyledText(String text, IconData icon) {
    return TextSpan(
      children: [
        WidgetSpan(
          child: Icon(icon, color: AppTheme.primaryColor, size: 18),
          alignment: PlaceholderAlignment.middle,
        ),
        const WidgetSpan(child: SizedBox(width: 8)), // Spacing between icon and text
        TextSpan(
          text: text,
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 600, // Decreased width for a smaller form
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Keep form compact
            children: [
              TextFormField(
                controller: _nameController,

                validator: _validateName,
                decoration: InputDecoration(
                  hintText: "Your Name",
                  hintStyle: GoogleFonts.nunito(fontSize: 14),
                  filled: true,
                  fillColor: Colors.grey[200],

                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                    borderSide: BorderSide.none, // No border
                  ),                label: RichText(
                    text: getStyledText("Your Name", Icons.person),
                  ),
                ),

              ),
              const SizedBox(height: 8),
              TextFormField(
                validator: _validateEmail,
                 controller: _emailController,

                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: GoogleFonts.nunito(fontSize: 14),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                    borderSide: BorderSide.none, // No border
                  ),                  label: RichText(
                    text: getStyledText("Email", Icons.email),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 3,
                controller: _messageController,
                validator: _validateMessage,
                decoration: InputDecoration(
                  hintText: "Message",
                  hintStyle: GoogleFonts.nunito(fontSize: 14),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                    borderSide: BorderSide.none, // No border
                  ),                  label: RichText(
                    text: getStyledText("Message", Icons.message),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:AppTheme.primaryColor,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    _submitForm();
                   },
                  child: Text(
                    "Submit Review",
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
