import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_diasplay.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_asstes/local_assets.dart';

import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_para.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_related_section.dart';
import 'package:provider/provider.dart';
class BusinessDetailScreen extends StatefulWidget {
  Business business;
  BusinessDetailScreen({super.key,required this.business});

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
        appBar: CustomAppBar(),
        body: Consumer<BusinessDirectoryProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeroSectionWithPageName(pageName: widget.business.name,onClickableTextTap: () => context.go(WebRouteNames.businessDirectory),clickableText: LocalStrings.businessDirectory,),

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
                                        child: BusinessDetailsSection(business: widget.business,),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: isSmallScreen ? 16 : 32), // Spacing

                                Expanded(
                                  flex: isSmallScreen ? 1 : 2,
                                  child: Image.network(
                                    widget.business.image, // Replace with your network image URL
                                    width: 600, // Fixed width
                                    height: 300, // Fixed height
                                    fit: BoxFit.fitHeight,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(child: CircularProgressIndicator()); // Show loader while loading
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/image_not_availible_img.png',
                                        width: 600,
                                        height: 300,
                                        fit: BoxFit.fitHeight,
                                      ); // Show asset image on error
                                    },
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Divider(
                          color: Colors.grey,  // Divider color
                          thickness: 2,  // Divider thickness
                          height: 20,  // Space around the divider
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SelectableText(
                              'Rate and Review',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: List.generate(5, (index) => _buildStar(index + 1)),
                            // ),
                            StarRatingBar(rating: value.rating,),
                            const SizedBox(height: 20),
                            Container(
                              width: 650,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F2F2),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                children: [
                                  TextField(
                                    controller: value.reviewController,
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                      hintText: 'Write your review here ...',
                                      hintStyle: TextStyle(color: AppTheme.primaryColor), // Set hint text color
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(12),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10, // Position it towards the right
                                    bottom: 10, // Align at the bottom
                                    child: GestureDetector(
                                      onTap: () {

                                        // Handle attachment click
                                      },
                                      child: Icon(
                                        Icons.attach_file,
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            const SizedBox(height: 20),
                            SizedBox(
                              width: 700,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  value.submitReview(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:  AppTheme.primaryColor,
                                  padding: const EdgeInsets.symmetric(vertical: 12,  ),
                                ),

                                child: const SelectableText('Submit Review', style: TextStyle(fontSize: 16,color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60),

                      Center(child: RelatedBusinessSection()),

                      SizedBox(height: 40),

                      FooterBar()

                    ]
                )
            );
          },

        )
    );
  }
}











