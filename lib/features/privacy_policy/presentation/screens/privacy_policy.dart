// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
//
// import '../../../../core/common_widgets/footer_bar.dart';
// import '../../../../core/local/local_strings.dart';
// import '../widget/privacy.dart';
//
//
// class PrivacyScreen extends StatefulWidget {
//   const PrivacyScreen({super.key});
//
//   @override
//   State<PrivacyScreen> createState() => _PrivacyScreenState();
// }
//
// class _PrivacyScreenState extends State<PrivacyScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         extendBodyBehindAppBar: true,
//         //backgroundColor: AppTheme.primaryColor,
//         appBar: CustomAppBar(height: 88),
//     body: SingleChildScrollView(
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       LayoutBuilder(
//         builder: (context, constraints) {
//           double maxWidth = constraints.maxWidth;
//           bool isSmallScreen = maxWidth < 900;
//
//           return Container(
//             color: AppTheme.primaryColor,
//             width: isSmallScreen ? maxWidth : 1680,
//             // Adjust width
//             // height: 291,
//             height: 250,
//             // Fixed height
//
//             alignment: Alignment.center,
//             padding: EdgeInsets.symmetric(
//                 horizontal: isSmallScreen ? 16 : 32),
//             // Responsive padding
//             child: Center(
//               child: Text(
//                 LocalStrings.privacyHeading,
//                 style: TextStyle(
//                   fontSize: isSmallScreen ? 24 : 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           );
//         },
//       ),
//       PrivacyPolicySection(),
//       SizedBox(height: 30,),
//
//
//       FooterBar()
//
//
//
//     ])
//     ));
//   }}
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
// import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
//
// import '../../../../core/common_widgets/footer_bar.dart';
// import '../../../../core/local/local_asstes/local_assets.dart';
// import '../../../../core/local/local_strings.dart';
// import '../widget/privacy.dart';
//
// class PrivacyScreen extends StatefulWidget {
//   const PrivacyScreen({super.key});
//
//   @override
//   State<PrivacyScreen> createState() => _PrivacyScreenState();
// }
//
// class _PrivacyScreenState extends State<PrivacyScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       extendBodyBehindAppBar: true,
//       appBar: CustomAppBar(height: 88),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             HeroSectionWithPageName(pageName: LocalStrings.privacyHeading),
//             // LayoutBuilder(
//             //   builder: (context, constraints) {
//             //     double maxWidth = constraints.maxWidth;
//             //     bool isSmallScreen = maxWidth < 900;
//             //
//             //     return Container(
//             //       color: AppTheme.primaryColor,
//             //       width: isSmallScreen ? maxWidth : 1680,
//             //       height: 250, // Fixed height
//             //       alignment: Alignment.center,
//             //       padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 32),
//             //       child: Center(
//             //         child: Text(
//             //           LocalStrings.privacyHeading,
//             //           style: TextStyle(
//             //             fontSize: isSmallScreen ? 24 : 32,
//             //             fontWeight: FontWeight.bold,
//             //             color: Colors.white,
//             //           ),
//             //           textAlign: TextAlign.center,
//             //         ),
//             //       ),
//             //     );
//             //   },
//             // ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   bool isSmallScreen = constraints.maxWidth < 900;
//
//                   return Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: PrivacyPolicySection(),
//                       ),
//                       if (!isSmallScreen) // Show image only on larger screens
//                         Expanded(
//                           flex: 1,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 16.0),
//                             child: Image.asset(
//                               LocalAssets.policyImage,
//                               height: 250, // Adjust height as needed
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 30),
//             FooterBar(),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
 import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';

import '../../../../core/common_widgets/footer_bar.dart';
import '../../../../core/local/local_asstes/local_assets.dart';
import '../../../../core/local/local_strings.dart';
import '../widget/privacy.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 900;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(height: 88),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSectionWithPageName(pageName: LocalStrings.privacyHeading),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 32, vertical: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Expanded Privacy Policy Section
                          Expanded(
                            flex: 2,
                            child: const PrivacyPolicySection(),
                          ),

                          // Show Image on Larger Screens
                          if (!isSmallScreen)
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Image.asset(
                                  LocalAssets.policyImage,
                                  height: screenWidth * 0.25, // Scales dynamically
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
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
