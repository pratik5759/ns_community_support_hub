// // import 'package:flutter/material.dart';
// // import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// // import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
// // import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
// // import 'package:ns_community_support_hub/core/common_widgets/log_in_popup.dart';
// //
// // class AppScaffold extends StatelessWidget {
// //   final Widget child; // This will hold the changing content
// //
// //   const AppScaffold({super.key, required this.child});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: CustomAppBar(), // Common App Bar
// //       body: child, // This is where different pages load dynamically
// //       floatingActionButton: Stack(
// //         children: [
// //           // Rectangle button background
// //           Positioned(
// //             bottom: 16, // Adjust as needed
// //             right: 16,  // Adjust as needed
// //             child: Container(
// //               padding: const EdgeInsets.only(left: 5,right: 5),
// //               height: 50, // Increased height for background
// //               decoration: BoxDecoration(
// //                 color: AppTheme.ctaColor,
// //                 borderRadius: BorderRadius.circular(8), // Rounded corners
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.grey.withOpacity(0.5),
// //                     spreadRadius: 2,
// //                     blurRadius: 5,
// //                     offset: const Offset(0, 3),
// //                   ),
// //                 ],
// //               ),
// //               child: TextButton(
// //                 onPressed: () {
// //                   showLoginPopup(context);
// //                   // if (!AuthService.instance.isLoggedIn) {
// //                   //   showLoginDialog(context, () {});
// //                   //   return;
// //                   // } else {
// //                   //   Navigator.push(
// //                   //     context,
// //                   //     MaterialPageRoute(builder: (context) => const AddBusinessPage()),
// //                   //   );
// //                   // }
// //                 },
// //                 child: const Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Icon(Icons.add, color: Colors.white),
// //                     SizedBox(width: 6),
// //                     Text(
// //                       'Add Business',
// //                       style: TextStyle(color: Colors.white, fontSize: 16),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       // floatingActionButton: FloatingActionButton(onPressed: () {
// //       //
// //       // },child: Text("Hi"),),
// //     );
// //   }
// //
// //
// //   void showLoginPopup(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       barrierDismissible: true, // Allows closing the popup when tapping outside
// //       builder: (BuildContext context) {
// //         return Dialog(
// //           backgroundColor: Colors.transparent, // Keeps background outside popup transparent
// //           child: LoginPopup(),
// //         );
// //       },
// //     );
// //   }
// //
// // }
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
// import 'package:ns_community_support_hub/core/common_widgets/log_in_popup.dart';
// import 'package:ns_community_support_hub/core/services/auth_service.dart';
//
// class AppScaffold extends StatefulWidget {
//   final Widget child; // This will hold the changing content
//
//   const AppScaffold({super.key, required this.child});
//
//   @override
//   State<AppScaffold> createState() => _AppScaffoldState();
// }
//
// class _AppScaffoldState extends State<AppScaffold> {
//   @override
//   Widget build(BuildContext context) {
//     String currentRoute = GoRouterState.of(context).uri.toString();
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: CustomAppBar(), // Common App Bar
//       body: widget.child, // This is where different pages load dynamically
//       floatingActionButton: _getFAB(context, currentRoute), // Responsive FAB
//     );
//   }
//
//   Widget _getFAB(BuildContext context, String route) {
//
//     if (route == WebRouteNames.businessDirectory) {
//       return _buildResponsiveFAB(context, 'Add Business', Icons.add_business, () async {
//         bool isLoggedIn = await AuthService().isUserLoggedIn();
//         isLoggedIn ? null : showLoginPopup(context);
//       });
//     } else if (route == WebRouteNames.events) {
//       return _buildResponsiveFAB(context, 'Add Event', Icons.event, () async {
//         bool isLoggedIn = await AuthService().isUserLoggedIn();
//         isLoggedIn ? null : showLoginPopup(context);
//       });
//     } else {
//       return SizedBox.shrink(); // Hide FAB if route is unknown
//     }
//   }
//
//   Widget _buildResponsiveFAB(BuildContext context, String label, IconData icon, VoidCallback onPressed) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     bool isMobile = screenWidth < 600;
//     bool isTablet = screenWidth >= 600 && screenWidth < 1024;
//     bool isWeb = screenWidth >= 1024;
//
//     return FloatingActionButton.extended(
//       onPressed: onPressed,
//       backgroundColor: AppTheme.ctaColor,
//       icon: Icon(icon, color: Colors.white),
//       label: isMobile ? SizedBox.shrink() : Text(label, style: TextStyle(color: Colors.white, fontSize: isWeb ? 18 : 16)),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//     );
//   }
//
//   void showLoginPopup(BuildContext context) {
//
//     showDialog(
//       context: context,
//       barrierDismissible: true, // Allows closing the popup when tapping outside
//       builder: (BuildContext dialogContext) { // Use a different context for the dialog
//         return Dialog(
//           backgroundColor: Colors.transparent, // Keeps background outside popup transparent
//           child: LoginPopup(
//             onCancel: () => context.pop(), // Close dialog using GoRouter
//             onLogin: () async {
//               await AuthService().signInWithGooglePopup();
//               context.pop(); // Close dialog
//               // Perform login action here
//             },
//           ),
//         );
//       },
//     );
//   }
// }
//
