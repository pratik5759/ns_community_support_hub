import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/auth_provider.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/common_widgets/log_in_popup.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_clickable.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_diasplay.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/core/services/auth_service.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_para.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_related_section.dart';
import 'package:ns_community_support_hub/features/pageNotFound404/presentation/page_not_found_screen.dart';
import 'package:provider/provider.dart';
// class BusinessDetailScreen extends StatefulWidget {
//   /*Business business;*/
//   BusinessDetailScreen({super.key,/*required this.business*/});
//
//   @override
//   State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
// }
//
// class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
//
//   String? businessId;
//   Business? business;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     if(business == null){
//
//       if(businessId != null){
//         businessId = GoRouterState.of(context).pathParameters['id'];
//         debugPrint('Business Id : $businessId');
//         context.read<BusinessDirectoryProvider>().getBusinessById(businessId!);
//       }
//
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         extendBodyBehindAppBar: true,
//         //backgroundColor: AppTheme.primaryColor,
//         appBar: CustomAppBar(scaffoldKey: AppConstants.scaffoldKey,),
//         body: Consumer<BusinessDirectoryProvider>(
//           builder: (BuildContext context, value, Widget? child) {
//             return SingleChildScrollView(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       HeroSectionWithPageName(pageName: business!.name,onClickableTextTap: () => context.go(WebRouteNames.businessDirectory),clickableText: LocalStrings.businessDirectory,),
//
//                       LayoutBuilder(
//                         builder: (context, constraints) {
//                           double maxWidth = constraints.maxWidth;
//                           bool isSmallScreen = maxWidth < 900;
//
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 24, vertical: 32),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Left: Image
//
//                                 // Right: Heading & Paragraph
//                                 Expanded(
//                                   flex: 3,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(height: 16),
//                                       Padding(
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal:
//                                           AppConstants.fullPagePaddingHorizontal,
//                                         ),
//                                         child: BusinessDetailsSection(business: business!,),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(width: isSmallScreen ? 16 : 32), // Spacing
//
//                                 Expanded(
//                                   flex: isSmallScreen ? 1 : 2,
//                                   child: Image.network(
//                                     business!.image, // Replace with your network image URL
//                                     width: 600, // Fixed width
//                                     height: 300, // Fixed height
//                                     fit: BoxFit.fitHeight,
//                                     loadingBuilder: (context, child, loadingProgress) {
//                                       if (loadingProgress == null) return child;
//                                       return Center(child: CircularProgressIndicator()); // Show loader while loading
//                                     },
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Image.asset(
//                                         'assets/images/image_not_available_img.png',
//                                         width: 600,
//                                         height: 300,
//                                         fit: BoxFit.fitHeight,
//                                       ); // Show asset image on error
//                                     },
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                         child: Divider(
//                           color: Colors.grey,  // Divider color
//                           thickness: 2,  // Divider thickness
//                           height: 20,  // Space around the divider
//                         ),
//                       ),
//
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const SelectableText(
//                               'Rate and Review',
//                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 10),
//                             // Row(
//                             //   mainAxisAlignment: MainAxisAlignment.center,
//                             //   children: List.generate(5, (index) => _buildStar(index + 1)),
//                             // ),
//                             StarRatingBar(rating: value.rating,),
//                             const SizedBox(height: 20),
//                             Container(
//                               width: 650,
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFF2F2F2),
//                                 border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   TextField(
//                                     controller: value.reviewController,
//                                     maxLines: 4,
//                                     decoration: InputDecoration(
//                                       hintText: 'Write your review here ...',
//                                       hintStyle: TextStyle(color: AppTheme.primaryColor), // Set hint text color
//                                       border: InputBorder.none,
//                                       contentPadding: EdgeInsets.all(12),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     right: 10, // Position it towards the right
//                                     bottom: 10, // Align at the bottom
//                                     child: GestureDetector(
//                                       onTap: () {
//
//                                         // Handle attachment click
//                                       },
//                                       child: Icon(
//                                         Icons.attach_file,
//                                         color: AppTheme.primaryColor,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//
//                             const SizedBox(height: 20),
//                             SizedBox(
//                               width: 700,
//                               height: 50,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   value.submitReview(context);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor:  AppTheme.primaryColor,
//                                   padding: const EdgeInsets.symmetric(vertical: 12,  ),
//                                 ),
//
//                                 child: const SelectableText('Submit Review', style: TextStyle(fontSize: 16,color: Colors.white)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 60),
//
//
//                       RelatedBusinessSection(/*displayList: value.filteredBusinesses,*/),
//
//                       SizedBox(height: 40),
//
//                       FooterBar()
//
//                     ]
//                 )
//             );
//           },
//
//         )
//     );
//   }
// }
//


class BusinessDetailScreen extends StatefulWidget {
  BusinessDetailScreen({super.key});

  @override
  State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
  String? businessId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<BusinessDirectoryProvider>();
      businessId = GoRouterState.of(context).pathParameters['id'];
      print('Business Id: $businessId');

      if (businessId != null) {
        if (provider.allBusinesses.isEmpty) {
          print('Business list is empty! Fetching now...');
          provider.loadBusinesses().then((_) {
            print('✅ Businesses loaded. Fetching business by ID...');
            provider.getBusinessById(businessId!);
          });
        } else {
          provider.getBusinessById(businessId!);
        }
      }
    });
  }


  void showLoginPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows closing the popup when tapping outside
      builder: (BuildContext dialogContext) { // Use a different context for the dialog
        return Dialog(
          backgroundColor: Colors.transparent, // Keeps background outside popup transparent
          child: LoginPopup(
            onCancel: () => context.pop(), // Close dialog using GoRouter
            onLogin: () async {
              await context.read<AuthenticationProvider>().signInWithGoogle();
              context.pop(); // Close dialog
              // Perform login action here
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(scaffoldKey: AppConstants.scaffoldKey),
      body: Consumer<BusinessDirectoryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.businessDetails == null) {
            return PageNotFoundScreen();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                HeroSectionWithPageName(
                  pageName: provider.businessDetails!.name,
                  onClickableTextTap: () => context.go(WebRouteNames.businessDirectory),
                  clickableText: LocalStrings.businessDirectory,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = constraints.maxWidth;
                    bool isSmallScreen = maxWidth < 900;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
                              child: BusinessDetailsSection(business: provider.businessDetails!),
                            ),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            flex: isSmallScreen ? 1 : 2,
                            child: Image.network(
                              provider.businessDetails!.image,
                              width: 600,
                              height: 300,
                              fit: BoxFit.fitHeight,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/image_not_available_img.png',
                                  width: 600,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SelectableText(
                        'Rate and Review',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: List.generate(5, (index) => _buildStar(index + 1)),
                      // ),

                      StarRating(
                        //rating: value.rating,
                      ),

                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 650,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              TextField(
                                controller: provider.reviewController,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  hintText: 'Write your review here ...',
                                  hintStyle:
                                  TextStyle(color: AppTheme.primaryColor),
                                  // Set hint text color
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(12),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                // Position it towards the right
                                bottom: 10,
                                // Align at the bottom
                                child: GestureDetector(
                                  onTap: () {
                                    if (kIsWeb) {
                                      // running on the web!
                                      provider.pickImageWeb();
                                    } else {
                                      // NOT running on the web! You can check for additional platforms here.
                                      provider.pickImageAndroid();
                                    }

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
                      ),

                      const SizedBox(height: 20),
                      SizedBox(
                        width: 700,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            bool isLoggedIn = await AuthService().isUserLoggedIn();

                            if (isLoggedIn) {
                              // User is logged in, submit review
                              await provider.submitReview(context, businessId!);
                            } else {
                              // User is not logged in, show login popup
                              showLoginPopup(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                          ),
                          child: const SelectableText('Submit Review',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white)),                  ),

                        //ElevatedButton(
                        //   onPressed: () async {
                        //     value.submitReview(context, widget.business.id);
                        //     bool isLoggedIn = await AuthService().isUserLoggedIn();
                        //     isLoggedIn ? context.go(WebRouteNames.addBusiness) : showLoginPopup(context);
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: AppTheme.primaryColor,
                        //     padding: const EdgeInsets.symmetric(
                        //       vertical: 12,
                        //     ),
                        //   ),
                        //   child: const SelectableText('Submit Review',
                        //       style: TextStyle(
                        //           fontSize: 16, color: Colors.white)),
                        // ),
                      ),
                    ],
                  ),
                ),
                RelatedBusinessSection(),
                const SizedBox(height: 40),
                FooterBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}











