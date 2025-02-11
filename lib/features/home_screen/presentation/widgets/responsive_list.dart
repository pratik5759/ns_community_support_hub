

/*import 'package:flutter/material.dart';
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
}*/

import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';

class ResponsiveListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate container width based on screen width for responsiveness
    double containerWidth = screenWidth * 0.22; // Default for larger screens
    double imageHeight = 180; // Fixed height for images
    double textWidth = containerWidth * 0.8; // Text width proportional to the container width

    // Determine if the screen is small and adjust layout accordingly
    bool isSmallScreen = screenWidth < 600; // Small screen threshold
    if (isSmallScreen) {
      containerWidth = screenWidth * 0.45; // Wider containers on small screens
      imageHeight = 150; // Smaller images for small screens
      textWidth = containerWidth * 0.9; // Text width adjusted for small screens
    }

    return Container(
      color: Colors.white,
      width: screenWidth, // Adjusted width to fit screen size
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;

          return Column(
            children: [
              // Ensure the items are aligned in a grid-like manner with flexibility
              GridView.builder(
                shrinkWrap: true, // Makes it scrollable when necessary
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmallScreen ? 2 : 4, // Adjust column count for small screens
                  crossAxisSpacing: 16, // Spacing between items horizontally
                  mainAxisSpacing: 16, // Spacing between items vertically
                  childAspectRatio: (containerWidth / (imageHeight + 80)), // Aspect ratio for responsiveness
                ),
                itemCount: 4, // Number of items
                itemBuilder: (context, index) {
                  return Container(
                    width: containerWidth,
                    height: imageHeight + 60, // Dynamic height adjustment
                    child: Column(
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
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}





