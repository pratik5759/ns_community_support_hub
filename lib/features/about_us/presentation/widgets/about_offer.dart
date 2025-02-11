import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class AboutOffer extends StatelessWidget {
  const AboutOffer({super.key});


  List<TextSpan> getStyledParagraph(String paragraph) {
    // Define the words or phrases to be bold
    List<String> boldPhrases = [
      'Knackbe Technologies Pvt. Ltd.',
      //'\"Nova Scotia Support Hub\"'
    ];

    // Split the paragraph into words or sentences
    List<TextSpan> textSpans = [];
    String remainingText = paragraph;

    // Loop through all bold phrases and replace them with styled TextSpans
    for (String phrase in boldPhrases) {
      // Search for the phrase in the paragraph
      int index = remainingText.indexOf(phrase);

      // While the phrase is found in the remaining text
      while (index != -1) {
        // Add the part before the phrase
        if (index > 0) {
          String beforePhrase = remainingText.substring(0, index);
          textSpans.add(TextSpan(
            text: beforePhrase,
            style: GoogleFonts.nunito(
              fontSize: AppConstants.smallFontSize,
            ),
          ));
        }

        // Add the bold phrase
        textSpans.add(TextSpan(
          text: phrase,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
            fontSize: AppConstants.smallFontSize,
          ),
        ));

        // Remove the processed part of the string
        remainingText = remainingText.substring(index + phrase.length);
        // Search again for the phrase in the remaining text
        index = remainingText.indexOf(phrase);
      }
    }

    // Add any remaining text after the last bold phrase
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            LocalStrings.aboutOffer,
            style: GoogleFonts.nunito(
              fontSize: AppConstants.bigFontSize,
              fontWeight: FontWeight.bold,
              color: AppTheme.whiteColor,
            ),
          ),
          const SizedBox(height: 12),


          OfferWidget(
             content: [
              'Business Listings: Discover a wide variety of Indian-owned businesses in Canada, ranging from restaurants, grocery stores, and boutiques to professional services, healthcare, education, and more. Our platform allows you to search businesses by categories, location, or the business owner'

            ],
          ),
          const SizedBox(height: 12),
          OfferWidget(
             content: [
              'Community Events: Stay updated on the latest Indian community events, cultural festivals, workshops, and social gatherings happening near you. Our event calendar ensures you never miss out on opportunities to connect, celebrate, and engage with the community.'
            ],
          ),
          const SizedBox(height: 12),
          OfferWidget(
             content: [
          'User Reviews and Ratings: Make informed decisions with the help of genuine user reviews and ratings. Share your experiences and help others discover trusted businesses and services within the community.'

            ],
          ),
          const SizedBox(height: 12),
          OfferWidget(

            content: [
               'Free Platform for Businesses: We provide a completely free platform for Indian business owners to list their services, showcase their offerings, and reach their target audience effectively'

              ],
          ),
          const SizedBox(height: 12),
          OfferWidget(
             content: [
            'Local Deals and Offers: Find special offers, discounts, and deals from local businesses in your area. Support the community while enjoying great savings.'

            ],
          ),








          // Text.rich(
          //     TextSpan(
          //       style: GoogleFonts.nunito(
          //         fontSize: AppConstants.bigFontSize,
          //         color: AppTheme.whiteColor,
          //       ),
          //       children: getStyledParagraph(LocalStrings.aboutOfferpara,
          //
          //
          //
          //
          //       ),
          //     )
          // ),
        ],
      ),
    );
  }
}

class OfferWidget extends StatelessWidget {
  //final String title;
  final List<String> content;

  const OfferWidget({
    Key? key,
   // required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   title,
        //   style: GoogleFonts.nunito(
        //     fontSize: AppConstants.bigFontSize,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        const SizedBox(height: 8),
        ...content.map((text) => _buildBulletPointText(text)),
      ],
    );
  }

  Widget _buildBulletPointText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(
              Icons.circle, // Bullet point icon
              size: 8.0,
              color: Colors.white, // Bullet color moved to AppTheme
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.nunito(
                fontSize: AppConstants.smallFontSize,
                color: AppTheme.whiteColor, // Text color handled centrally
              ),
            ),
          ),
        ],
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
