import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_asstes/local_assets.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/home_business_list.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/home_events_list.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/responsive_list.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/search_bar.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/text_section.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/vision_mission_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            /*/// hero section
            Container(
              color: AppTheme.primaryColor,
              height: AppConstants.paddingFromTopForAppBar,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /// text and search bar section
                      Column(
                        spacing: 36,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LocalStrings.heroHeading,style: AppConstants.nunitoBigWhiteW700,),
                          Text(LocalStrings.heroSubHeading,style: AppConstants.nunitoMediumWhiteW500,),
                          // const SizedBox(
                          //   height: 26,
                          // ),
                          CustomSearchBar(height: 48,width: 600,)

                        ],
                      ),

                      /// hero image
                      Image.asset(LocalAssets.heroSectionImage)
                    ],
                  ),
                ),
              ),
            ),
*/


            /// Hero Section
            Container(
              color: AppTheme.primaryColor,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = constraints.maxWidth;
                    bool isSmallScreen = maxWidth < 900; // Adjust layout for smaller screens

                    return Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: isSmallScreen
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocalStrings.heroHeading,
                            style: AppConstants.nunitoBigWhiteW700,
                          ),
                          Text(
                            LocalStrings.heroSubHeading,
                            style: AppConstants.nunitoMediumWhiteW500,
                          ),
                          SizedBox(height: 20),
                          CustomSearchBar(
                            height: 48,
                            width: maxWidth * 0.9, // Adjust width dynamically
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Image.asset(
                              LocalAssets.heroSectionImage,
                              width: maxWidth * 0.7, // Scale image dynamically
                            ),
                          ),
                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Left Section - Text and Search Bar
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocalStrings.heroHeading,
                                  style: AppConstants.nunitoBigWhiteW700,
                                ),
                                Text(
                                  LocalStrings.heroSubHeading,
                                  style: AppConstants.nunitoMediumWhiteW500,
                                ),
                                SizedBox(height: 20),
                                CustomSearchBar(
                                  height: 48,
                                  width: maxWidth * 0.4, // Dynamic width
                                ),
                              ],
                            ),
                          ),

                          /// Right Section - Hero Image
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                LocalAssets.heroSectionImage,
                                width: maxWidth * 0.4, // Scale image based on screen size
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),



            /// list below hero section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
              child: ResponsiveListView(),
            ),

            /// text section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal,vertical: 10),
              child: TextSection(),
            ),


            /// home business list
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F7)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal,vertical: 24),
                    child: Text(
                      LocalStrings.businessNearYou,
                      style: GoogleFonts.nunito(
                        fontSize: AppConstants.bigFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  HomeBusinessList(),

                  const SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal,vertical: 24),
                    child: Text(
                      LocalStrings.whatsHappeningNearYou,
                      style: GoogleFonts.nunito(
                        fontSize: AppConstants.bigFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  HomeEventsList(),

                  const SizedBox(height: 12),
                ],
              ),
            ),

            /// vision mission section
            VisionMissionSection(),

            FooterBar()
          ],
        ),
      ),

    );
  }
}









