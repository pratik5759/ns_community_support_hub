import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';

import 'package:ns_community_support_hub/core/local/local_strings.dart';

import '../../../../core/local/app_constants.dart';
import '../../../../core/local/local_asstes/local_assets.dart';
import '../../../about_us/presentation/widgets/about_mission.dart';
import '../widgets/business_para.dart';

class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen({super.key});

  @override
  State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
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
              LayoutBuilder(
                builder: (context, constraints) {
                  double maxWidth = constraints.maxWidth;
                  bool isSmallScreen = maxWidth < 900;

                  return Container(
                    color: AppTheme.primaryColor,
                    width: isSmallScreen ? maxWidth : 1680,
                    // Adjust width
                    // height: 291,
                    height: 250,
                    // Fixed height

                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 16 : 32),
                    // Responsive padding
                    child: Center(
                      child: Text(
                        LocalStrings.businessdHeading,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 24 : 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
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
                                    child: BusinessPara(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: isSmallScreen ? 16 : 32), // Spacing

                            Expanded(
                              flex: isSmallScreen ? 1 : 2,
                              child: Image.asset(
                                LocalAssets.BusinessdImage,
                                // width: isSmallScreen ? maxWidth * 0.8 : 400,
                                // height: isSmallScreen ? 200 : 300,
                                width: 600, // Fixed width
                                height: 400, // Fixed height
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),





                ]
            )
        )
    );
  }
}











