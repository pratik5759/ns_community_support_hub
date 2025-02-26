

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_asstes/local_assets.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/about_us/presentation/widgets/about_commit.dart';
import 'package:ns_community_support_hub/features/about_us/presentation/widgets/about_contact.dart';
import 'package:ns_community_support_hub/features/about_us/presentation/widgets/about_join.dart';
import 'package:ns_community_support_hub/features/about_us/presentation/widgets/about_mission.dart';
import 'package:ns_community_support_hub/features/about_us/presentation/widgets/about_offer.dart';
import 'package:ns_community_support_hub/features/about_us/presentation/widgets/about_section.dart';
import 'package:ns_community_support_hub/features/about_us/presentation/widgets/about_story.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 900;
    final bool isExtraSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(height: 88),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSectionWithPageName(pageName: LocalStrings.aboutHeading),

            // About Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 24, vertical: 32),
              child: Column(
                children: [
                  ResponsiveRow(
                    reverse: isSmallScreen,
                    leftChild: Image.asset(
                      LocalAssets.aboutSectionImage,
                      width: isSmallScreen ? screenWidth * 0.8 : 460,
                      height: isSmallScreen ? 300 : 460,
                      fit: BoxFit.fill,
                    ),
                    rightChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutSection(),
                        AboutStory(),
                      ],
                    ),
                  ),

                  ResponsiveRow(
                    leftChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutMission(),
                      ],
                    ),
                    rightChild: Image.asset(
                      LocalAssets.missionImage,
                      width: isSmallScreen ? screenWidth * 0.8 : 634,
                      height: isSmallScreen ? 300 : 461,
                      fit: BoxFit.fill,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isExtraSmallScreen ? 16 : 90, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: EdgeInsets.all(24),
                      child: ResponsiveRow(
                        leftChild: Image.asset(
                          LocalAssets.offerImage,
                          width: isSmallScreen ? screenWidth * 0.6 : 400,
                          height: isSmallScreen ? 280 : 500,
                          fit: BoxFit.fill,
                        ),
                        rightChild: AboutOffer(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
                    child: AboutCommit(),
                  ),
                  SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
                    child: AboutJoin(),
                  ),
                  SizedBox(height: 30),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        height: 95,
                        width: isSmallScreen ? screenWidth * 0.9 : 800,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: AboutContact(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 60),
            FooterBar(),
          ],
        ),
      ),
    );
  }
}

/// A helper widget for responsive row layouts
class ResponsiveRow extends StatelessWidget {
  final Widget leftChild;
  final Widget rightChild;
  final bool reverse;

  const ResponsiveRow({
    Key? key,
    required this.leftChild,
    required this.rightChild,
    this.reverse = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 900;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: isSmallScreen
          ? [
        Expanded(child: rightChild),
        SizedBox(height: 16),
        Expanded(child: leftChild),
      ]
          : reverse
          ? [Expanded(flex: 3, child: rightChild), SizedBox(width: 32), Expanded(flex: 2, child: leftChild)]
          : [Expanded(flex: 2, child: leftChild), SizedBox(width: 32), Expanded(flex: 3, child: rightChild)],
    );
  }
}
