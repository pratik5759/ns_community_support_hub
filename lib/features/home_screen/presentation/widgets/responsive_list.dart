



// import 'package:flutter/material.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
//
// class ResponsiveListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Get screen width from MediaQuery
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     // Calculate the container width for equal distribution of items
//     double containerWidth = screenWidth / 4; // Divide by number of items in a row (4 in this case)
//     double imageHeight = 250; // Fixed height for images on web
//     double textWidth = containerWidth * 0.8; // Text width proportional to the container width
//
//     return Container(
//       color: Colors.white,
//       height: imageHeight + 80, // Adjusted based on content
//       child: ListView.builder(
//         itemCount: AppConstants.itemLists.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Container(
//               //margin: EdgeInsets.(right: 20), // Adjust margin for spacing between containers
//               width: containerWidth,
//               height: imageHeight + 60,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: containerWidth * 0.8,
//                     height: imageHeight,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(AppConstants.itemLists[index].imagePath),
//                         fit: BoxFit.contain,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     width: textWidth,
//                     child: Text(
//                       AppConstants.itemLists[index].text,
//                       textAlign: TextAlign.center,
//                       style: AppConstants.nunitoMediumW500.copyWith(
//                         fontSize: 16, // Fixed font size for web
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';

class ResponsiveListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the container width for equal distribution of items
    double containerWidth = screenWidth * 0.22; // Divide by number of items in a row (4 in this case)
    double imageHeight = 180; // Fixed height for images on web
    double textWidth = containerWidth * 0.8; // Text width proportional to the container width

    return Container(
      color: Colors.white,
      height: imageHeight + 80,
      width: screenWidth,// Adjusted based on content
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          4, // Show only 4 items in a row
              (index) => Container(
            width: containerWidth,
            height: imageHeight + 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: containerWidth * 0.8,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppConstants.itemLists[index].imagePath),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //const SizedBox(height: 8),
                SizedBox(
                  width: textWidth,
                  child: Text(
                    AppConstants.itemLists[index].text,
                    textAlign: TextAlign.center,
                    style: AppConstants.nunitoMediumW500.copyWith(
                      fontSize: 16, // Fixed font size for web
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


