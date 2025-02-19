import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';

import 'package:ns_community_support_hub/core/local/local_strings.dart';

import '../../../../core/common_widgets/footer_bar.dart';
import '../../../../core/local/app_constants.dart';
import '../../../../core/local/local_asstes/local_assets.dart';
import '../widgets/business_other.dart';
import '../widgets/business_para.dart';

class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen({super.key});

  @override
  State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {


  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  void _submitReview() {
    String reviewText = _reviewController.text;
    if (_rating == 0 || reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide a rating and review')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Review Submitted: $_rating stars\n"$reviewText"')),
    );

    setState(() {
      _rating = 0;
      _reviewController.clear();
    });
  }

  Widget _buildStar(int starIndex) {
    return IconButton(
      icon: Icon(
        Icons.star,
        color: starIndex <= _rating ?  AppTheme.primaryColor : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _rating = starIndex;
        });
      },
    );
  }

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
                        const Text(
                          'Rate and Review',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) => _buildStar(index + 1)),
                        ),
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
                                controller: _reviewController,
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

                        // Container(
                        //   width: 650,
                        //   decoration: BoxDecoration(
                        //     color:Color(0xFFF2F2F2)
                        //     ,
                        //     border: Border.all(color: Colors.grey),
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        //   child: TextField(
                        //     controller: _reviewController,
                        //     maxLines: 4,
                        //     decoration: InputDecoration(
                        //       hintText: 'Write your review here ...',
                        //       hintStyle: TextStyle(color:  AppTheme.primaryColor, ), // Set hint text color
                        //
                        //       border: InputBorder.none,
                        //       contentPadding: EdgeInsets.all(12),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 700,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _submitReview,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  AppTheme.primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 12,  ),
                            ),

                            child: const Text('Submit Review', style: TextStyle(fontSize: 16,color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),

                  Center(child: BusinessSection()),

                  SizedBox(height: 40),

                  FooterBar()

                ]
            )
        )
    );
  }
}











