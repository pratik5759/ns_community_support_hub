

import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import '../../../../core/common_widgets/footer_bar.dart';
import '../../../../core/local/local_asstes/local_assets.dart';
import '../../../../core/local/local_strings.dart';
import '../widgets/terms_condi.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 900;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(height: 88,scaffoldKey: AppConstants.scaffoldKey,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSectionWithPageName(pageName: LocalStrings.termsHeading),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 32, vertical: 16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Terms & Conditions Section
                      Expanded(
                        flex: 2,
                        child: const TermsConditionSection(),
                      ),

                      // Show Image only on Large Screens
                      if (!isSmallScreen)
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Image.asset(
                              LocalAssets.termImage,
                              height: screenWidth * 0.3, // Dynamically adjust height
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            const FooterBar(),
          ],
        ),
      ),
    );
  }
}
