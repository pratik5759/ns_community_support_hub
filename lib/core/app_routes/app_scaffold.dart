import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';

class AppScaffold extends StatelessWidget {
  final Widget child; // This will hold the changing content

  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(), // Common App Bar
      body: child, // This is where different pages load dynamically
      floatingActionButton: Stack(
        children: [
          // Rectangle button background
          Positioned(
            bottom: 16, // Adjust as needed
            right: 16,  // Adjust as needed
            child: Container(
              padding: const EdgeInsets.only(left: 5,right: 5),
              height: 50, // Increased height for background
              decoration: BoxDecoration(
                color: AppTheme.ctaColor,
                borderRadius: BorderRadius.circular(8), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  // if (!AuthService.instance.isLoggedIn) {
                  //   showLoginDialog(context, () {});
                  //   return;
                  // } else {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => const AddBusinessPage()),
                  //   );
                  // }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 6),
                    Text(
                      'Add Business',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //
      // },child: Text("Hi"),),
    );
  }


}
