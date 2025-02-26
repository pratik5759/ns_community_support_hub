// import 'package:flutter/material.dart';
// import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
// import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
// import 'package:ns_community_support_hub/features/business-directory/presentation/widgets/business_search_bar.dart';
// import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/home_business_list.dart';
//
// class BusinessDirectoryScreen extends StatefulWidget {
//   const BusinessDirectoryScreen({super.key});
//
//   @override
//   State<BusinessDirectoryScreen> createState() => _BusinessDirectoryScreenState();
// }
//
// class _BusinessDirectoryScreenState extends State<BusinessDirectoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//
//             /// Hero Section with page name
//             HeroSectionWithPageName(pageName: LocalStrings.businessDirectory,),
//
//             LayoutBuilder(
//               builder: (context, constraints) {
//                 final double maxHeight = constraints.maxHeight;
//                 final double maxWidth = constraints.maxWidth;
//                 return BusinessSearchBar(height: 48, width: maxWidth);
//               },
//             ),
//
//             GridView.builder(
//               gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,  crossAxisSpacing: 8.0, // Spacing between columns
//                     mainAxisSpacing: 8.0, // Spacing between rows
//                     childAspectRatio: 0.8, // Adjust aspect ratio if needed
//                      ),
//               itemCount: 4,
//               itemBuilder: (context, index) {
//                 return BusinessListCard(
//                   businessName: 'demo',
//                   index: index,
//                 );
//               },
//             ),
//
//             FooterBar()
//           ],
//         ),
//       ),
//
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/auth_provider.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/common_widgets/log_in_popup.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/core/services/auth_service.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_card.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_card_skeleton.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_search_bar.dart';
import 'package:provider/provider.dart';

class BusinessDirectoryScreen extends StatefulWidget {
  const BusinessDirectoryScreen({super.key});

  @override
  State<BusinessDirectoryScreen> createState() => _BusinessDirectoryScreenState();
}

class _BusinessDirectoryScreenState extends State<BusinessDirectoryScreen> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.microtask(() async {
  //     var val = context.read<BusinessDirectoryProvider>();
  //     await val.loadBusinesses();
  //     if(val.isHomeSearch){
  //       await val.filterSearchBusiness();
  //     }
  //   },);
  // }

  @override
  void initState() {
    super.initState();
    debugPrint("initState called of business details called");

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      debugPrint("addPostFrameCallback triggered");

      var val = context.read<BusinessDirectoryProvider>();
      debugPrint("BusinessDirectoryProvider read");

      // await val.loadBusinesses();
      // debugPrint("loadBusinesses() completed");

      if (val.isHomeSearch) {
        debugPrint("isHomeSearch is true, calling filterSearchBusiness()");
        await val.filterSearchBusiness();
        debugPrint("filterSearchBusiness() completed");
        val.isHomeSearch = false;
      } else {
        debugPrint("isHomeSearch is false, skipping filterSearchBusiness()");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint('Dispose called');
      Future.microtask(() {
        debugPrint('Dispose called 1');
        if(!mounted){
          debugPrint('Dispose called2');
          context.read<BusinessDirectoryProvider>().searchBarController.dispose();
          context.read<BusinessDirectoryProvider>().searchBarController.clear();
        }
      },);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(scaffoldKey: AppConstants.scaffoldKey,),
      body: Consumer<BusinessDirectoryProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensures it takes only needed space
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Hero Section with page name
                HeroSectionWithPageName(pageName: LocalStrings.businessDirectory),

                /// responsive search bar
                SizedBox(
                  height: 8,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final double maxWidth = constraints.maxWidth;
                    return BusinessSearchBar(height: 48, width: maxWidth);
                  },
                ),

                /// GridView without independent scrolling
                Visibility(
                  visible: value.displayedBusinesses.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.fullPagePaddingHorizontal,
                      vertical: 16
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                  
                        // Define dynamic column count based on screen width
                        int crossAxisCount;
                        double childAspectRatio;
                  
                        if (screenWidth < 600) { // Mobile screens
                          crossAxisCount = 1;
                          childAspectRatio = 0.9; // Adjust to avoid overly stretched cards
                        } else if (screenWidth < 1024) { // Tablets
                          crossAxisCount = 2;
                          childAspectRatio = 1.0;
                        } else { // Desktops
                          crossAxisCount = 3;
                          childAspectRatio = 1.1;
                        }
                  
                        return value.displayedBusinesses.isEmpty ?   GridView.builder(
                          shrinkWrap: true, // Ensures GridView only takes required space
                          physics: const NeverScrollableScrollPhysics(), // Disables GridView scrolling
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 20.0, // Reduced for better fit on smaller screens
                            mainAxisSpacing: 20.0,
                            childAspectRatio: childAspectRatio,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return BusinessCardSkeleton();
                          },
                        ) :
                         MediaQuery.removePadding(
                           context: context,
                           removeTop: true,
                           child: GridView.builder(
                            shrinkWrap: true, // Ensures GridView only takes required space
                            physics: const NeverScrollableScrollPhysics(), // Disables GridView scrolling
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 20.0, // Reduced for better fit on smaller screens
                              mainAxisSpacing: 20.0,
                              childAspectRatio: childAspectRatio,
                            ),
                            itemCount: value.displayedBusinesses.length,
                            itemBuilder: (context, index) {
                              Business currentBusiness = value.displayedBusinesses[index];
                              return BusinessCard(business: currentBusiness);
                            },
                           ),
                         );
                      },
                    ),
                  ),
                ),
                Visibility(visible: value.displayedBusinesses.isEmpty,child: SizedBox(height: MediaQuery.of(context).size.height * 0.28,child: Center(child: Text("No Businesses to show !",style: GoogleFonts.nunito(fontSize: 24),)))),



                /// Footer Bar (Appears after all tiles)
                FooterBar(),
              ],
            ),
          );
        },
      ),
      floatingActionButton: _buildResponsiveFAB(context, 'Add Business', Icons.add_business, () async {
        bool isLoggedIn = await AuthService().isUserLoggedIn();
        isLoggedIn ? context.go(WebRouteNames.addBusiness) : showLoginPopup(context);
      }),
    );
  }


  Widget _buildResponsiveFAB(BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isWeb = screenWidth >= 1024;

    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AppTheme.ctaColor,
      icon: Icon(icon, color: Colors.white),
      label: isMobile ? SizedBox.shrink() : Text(label, style: TextStyle(color: Colors.white, fontSize: isWeb ? 18 : 16)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
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
}

