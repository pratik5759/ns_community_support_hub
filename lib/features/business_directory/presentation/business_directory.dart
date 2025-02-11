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
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_card.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_search_bar.dart';

class BusinessDirectoryScreen extends StatefulWidget {
  const BusinessDirectoryScreen({super.key});

  @override
  State<BusinessDirectoryScreen> createState() => _BusinessDirectoryScreenState();
}

class _BusinessDirectoryScreenState extends State<BusinessDirectoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Hero Section with page name
            HeroSectionWithPageName(pageName: LocalStrings.businessDirectory),

            /// responsive search bar
            LayoutBuilder(
              builder: (context, constraints) {
                final double maxWidth = constraints.maxWidth;
                return BusinessSearchBar(height: 48, width: maxWidth);
              },
            ),
            const SizedBox(height: 4),

            /// GridView without independent scrolling
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.fullPagePaddingHorizontal,
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

                  return GridView.builder(
                    shrinkWrap: true, // Ensures GridView only takes required space
                    physics: const NeverScrollableScrollPhysics(), // Disables GridView scrolling
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20.0, // Reduced for better fit on smaller screens
                      mainAxisSpacing: 20.0,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return BusinessCard(businessName: 'Demo Demo', index: index);
                    },
                  );
                },
              ),
            ),


            /// Footer Bar (Appears after all tiles)
            FooterBar(),
          ],
        ),
      ),
    );
  }
}

