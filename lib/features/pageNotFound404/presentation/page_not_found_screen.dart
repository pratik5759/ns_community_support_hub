// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
// import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
// import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
//
// class PageNotFoundScreen extends StatelessWidget {
//   const PageNotFoundScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.height * 75,
//           height: MediaQuery.of(context).size.height * 75,
//           child: Card(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // Icon or image for 404
//                 Image.asset('assets/images/404_not_img.png'),
//                 SizedBox(height: 20.0),
//                 // Text showing 404
//                 Text(
//                   '404',
//                   style: TextStyle(
//                     fontSize: 48.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 // Text explaining the error
//                 Text(
//                   'Page Not Found',
//                   style: GoogleFonts.nunito(
//                     fontSize: 24
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 // Button to redirect to homepage
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigate to the homepage or desired location
//                     // Example using Navigator.pushReplacementNamed:
//                    context.go(WebRouteNames.home);
//                   },
//                   child: Text('Go to Homepage',style: GoogleFonts.nunito(),),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';

class PageNotFoundScreen extends StatelessWidget {
  String title;
  String errorCode;
  String errorMessage;

  PageNotFoundScreen(
      {super.key,
      this.title = 'Page Not Found',
      this.errorCode = '404',
      this.errorMessage =
          'Oops! The page you are looking for doesn\'t exist or has been moved.'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          // Define breakpoints for mobile, tablet, and web
          bool isMobile = screenWidth < 600;
          bool isTablet = screenWidth >= 600 && screenWidth < 1024;
          bool isWeb = screenWidth >= 1024;

          return Center(
            child: SizedBox(
              width: isMobile
                  ? screenWidth * 0.9
                  : isTablet
                  ? screenWidth * 0.6
                  : screenWidth * 0.4, // 40% width for web
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 24 : 40,
                    horizontal: isMobile ? 16 : 32,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/404_not_img.png',
                        height: isMobile ? 150 : 200,
                        width: isMobile ? 150 : 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        errorCode,
                        style: GoogleFonts.nunito(
                          fontSize: isMobile ? 60 : 80,
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        title,
                        style: GoogleFonts.nunito(
                          fontSize: isMobile ? 22 : 28,
                          color: AppTheme.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          errorMessage,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: isMobile ? 14 : 16,
                            color: AppTheme.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: () {
                          context.go(WebRouteNames.home);
                        },
                        child: Container(
                          width: isMobile ? double.infinity : 400,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppTheme.primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              'Go To Homepage',
                              style: GoogleFonts.nunito(
                                fontSize: isMobile ? 18 : 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

