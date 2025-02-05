/*
import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  double height;
  CustomAppBar({required this.height});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: 16),
      child: SizedBox(
        height: height,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppTheme.greyColor,
                offset: Offset(2, 2),
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                spreadRadius: 1
              ),
              */
/*BoxShadow(
                  color: AppTheme.greyColor,
                  offset: Offset(-5, 0),
                  blurRadius: 2,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 1
              )*//*

            ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              spacing: 16,
              children: [
                /// app title
                Text(LocalStrings.websiteName,style: AppConstants.nunitoBigW700,),
                SizedBox(
                  width: 184,
                ),
                TextButton( child:Text(LocalStrings.home,style: AppConstants.nunitoMediumW500,),onPressed: () {  },),
                TextButton( child:Text(LocalStrings.businessDirectory,style: AppConstants.nunitoMediumW500,),onPressed: () {  },),
                TextButton( child:Text(LocalStrings.events,style: AppConstants.nunitoMediumW500,),onPressed: () {  },),
                TextButton( child:Text(LocalStrings.aboutUs,style: AppConstants.nunitoMediumW500,),onPressed: () {  },),
                TextButton( child:Text(LocalStrings.faq,style: AppConstants.nunitoMediumW500,),onPressed: () {  },),
                TextButton( child:Text(LocalStrings.contactUs,style: AppConstants.nunitoMediumW500,),onPressed: () {  },),
                // Text(LocalStrings.businessDirectory,style: AppConstants.nunitoMediumW500,),
                // Text(LocalStrings.events,style: AppConstants.nunitoMediumW500,),
                // Text(LocalStrings.aboutUs,style: AppConstants.nunitoMediumW500,),
                // Text(LocalStrings.FAQ,style: AppConstants.nunitoMediumW500,),
                // Text(LocalStrings.contactUs,style: AppConstants.nunitoMediumW500,),
                SizedBox(
                  width: 184,
                ),
                TextButton( child:Row(
                  children: [
                    Icon(Icons.person_3_outlined,size: AppConstants.mediumFontSize,),
                    Text(LocalStrings.logIn,style: AppConstants.nunitoMediumW500,),
                  ],
                ),onPressed: () {  },),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}


*/
import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  double height;
  CustomAppBar({required this.height});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Define breakpoints for responsiveness
    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1024;
    final bool isLargeScreen = width >= 1024;

    return Stack(
      children: [
        Container(
          height: height/2,
          color: AppTheme.primaryColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: SizedBox(
            height: height,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  /*BoxShadow(
                color: AppTheme.greyColor,
                // offset: Offset(1, 1),
                offset: Offset(1, 1),
                blurRadius: 12,
                blurStyle: BlurStyle.normal,
                spreadRadius: 2,
              ),*/


                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(4, 8),
                    blurRadius: 12,
                    spreadRadius: -8,
                  ),

                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align items at start
                  children: [
                    if (isMobile) ...[
                      // For mobile, show the website name on the extreme left
                      Text(
                        LocalStrings.websiteName,
                        style: AppConstants.nunitoBigPrimaryColorW700,
                      ),
                    ],
                    if (!isMobile)
                    // App title for larger screens
                      Expanded(
                        child: Text(
                          LocalStrings.websiteName,
                          style: isTablet ? AppConstants.nunitoMediumPrimaryColorW700 : AppConstants.nunitoBigPrimaryColorW700,
                        ),
                      ),
                    if (isMobile) ...[
                      // For mobile, show the menu icon on the extreme right
                      Expanded(child: SizedBox()), // To push the name to the right
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          // Scaffold.of(context).openDrawer();
                        },
                      ),
                    ],
                    if (isLargeScreen) ...[
                      // For large screens (Web), show all navigation bar items
                      Spacer(),
                      _buildNavItem(LocalStrings.home),
                      _buildNavItem(LocalStrings.businessDirectory),
                      _buildNavItem(LocalStrings.events),
                      _buildNavItem(LocalStrings.aboutUs),
                      _buildNavItem(LocalStrings.faq),
                      _buildNavItem(LocalStrings.contactUs),
                      Spacer(),
                      _buildLoginButton(),
                    ] else if (isTablet) ...[
                      // For tablets, show limited navigation items
                      _buildNavItem(LocalStrings.home),
                      _buildNavItem(LocalStrings.businessDirectory),
                      _buildNavItem(LocalStrings.events),
                      _buildLoginButton(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  // Helper method to build navigation items with controlled padding
  Widget _buildNavItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduce horizontal padding
      child: TextButton(
        child: Text(
          text,
          style: AppConstants.nunitoMediumW500,
        ),
        onPressed: () {},
      ),
    );
  }

  // Helper method for the Login button
  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduce padding for the login button
      child: TextButton(
        child: Row(
          children: [
            Icon(
              Icons.person_3_outlined,
              size: AppConstants.mediumFontSize,
            ),
            Text(
              LocalStrings.logIn,
              style: AppConstants.nunitoMediumW500,
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

