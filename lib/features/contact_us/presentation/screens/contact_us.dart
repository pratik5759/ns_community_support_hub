import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import '../../../../core/common_widgets/footer_bar.dart';
import '../../../../core/local/app_constants.dart';
import '../../../../core/local/local_asstes/local_assets.dart';
import '../../../about_us/presentation/widgets/about_mission.dart';
import '../widgets/conatct.dart';
import '../widgets/conta_review.dart';
import '../widgets/why_choose.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        //backgroundColor: AppTheme.primaryColor,
        appBar: CustomAppBar(height: 88),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  HeroSectionWithPageName(pageName: LocalStrings.contactHeading,),
              // LayoutBuilder(
              //   builder: (context, constraints) {
              //     double maxWidth = constraints.maxWidth;
              //     bool isSmallScreen = maxWidth < 900;
              //
              //     return Container(
              //       color: AppTheme.primaryColor,
              //       width: isSmallScreen ? maxWidth : 1680,
              //       // Adjust width
              //       // height: 291,
              //       height: 250,
              //       // Fixed height
              //
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.symmetric(
              //           horizontal: isSmallScreen ? 16 : 32),
              //       // Responsive padding
              //       child: Center(
              //         child: Text(
              //           LocalStrings.contactHeading,
              //           style: TextStyle(
              //             fontSize: isSmallScreen ? 24 : 32,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //           ),
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     );
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: ContactSection(),
              ),


                  LayoutBuilder(
                    builder: (context, constraints) {
                      double maxWidth = constraints.maxWidth;
                      bool isSmallScreen = maxWidth < 900;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left: Image

                            // Right: Heading & Paragraph
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 16),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                      AppConstants.fullPagePaddingHorizontal,
                                    ),
                                    child: ContactReview(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 16 : 32), // Spacing

                            Expanded(
                              flex: isSmallScreen ? 1 : 2,
                              child: Image.asset(
                                LocalAssets.coImage,
                                // width: isSmallScreen ? maxWidth * 0.8 : 400,
                                // height: isSmallScreen ? 200 : 300,
                                width: 550, // Fixed width
                                height: 300, // Fixed height
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: WhyChoose(),
                  ),




                  SizedBox(height: 60),


                  FooterBar()
                ]
            )
        )
    );
  }
}
