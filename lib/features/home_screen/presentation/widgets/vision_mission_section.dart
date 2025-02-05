import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_asstes/local_assets.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class VisionMissionSection extends StatefulWidget {
  const VisionMissionSection({super.key});

  @override
  State<VisionMissionSection> createState() => _VisionMissionSectionState();
}

class _VisionMissionSectionState extends State<VisionMissionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.whiteColor,
      //height: 800,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  VisionMissionWidget(
                    title: 'Our Vision',
                    content: [
                      'To empower the Indian community in Canada by creating a centralized platform where every business, service, and community initiative is easily accessible, fostering a strong network of support, trust, and growth.'
                    ],
                  ),
                  const SizedBox(height: 28),
                  VisionMissionWidget(
                    title: 'Our Mission',
                    content: [
                      'Simplify Local Discovery: Easily find Indian businesses and services nearby, eliminating the need to sift through social media or WhatsApp groups.',
                      'Connect Through Culture: Discover businesses based on the owner’s state of origin, promoting cultural pride and making it easier to find products like traditional Maharashtrian spices or sweets.',
                      'Empower Entrepreneurs: Provide free, equal opportunities for all Indian businesses, big or small, to reach their community and grow.',
                      'Build Community Connections: Discover local events, cultural gatherings, and initiatives to foster deeper community engagement and support.',
                      'Enhance Trust & Quality: Transparent reviews and ratings help users make informed choices and access reliable, quality services.',
                      'Preserve Our Heritage: Celebrate and promote Indian culture through local businesses and events, keeping traditions alive in a modern world.'
                    ],
                  ),
                ],
              ),
            ),

            /// image section
            SizedBox(height: 400,child: Image.asset(LocalAssets.visionMissionSectionImage))
          ],
        ),
      ),
    );
  }
}


class VisionMissionWidget extends StatelessWidget {
  final String title;
  final List<String> content;

  const VisionMissionWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: AppConstants.bigFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...content.map((text) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only( top: 8.0),
                child: Icon(
                  Icons.circle, // Bullet point icon
                  size: 8.0,
                  color: Color(0xFF505050), // Bullet color
                ),
              ),
              const SizedBox(width: 8.0), // Space between bullet and text
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.nunito(
                    fontSize: AppConstants.smallFontSize,
                  ),
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}



/*class VisionMissionWidget extends StatelessWidget {
  final String title;
  final List<String> content;

  const VisionMissionWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            color: Color(0xFF505050),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ...content.map((text) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            text,
            style: GoogleFonts.nunito(
              color: Color(0xFF505050),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ))
      ],
    );
  }
}*/
