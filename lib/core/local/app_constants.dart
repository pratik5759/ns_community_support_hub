

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/models/items_model.dart';
//
// class AppConstants{
//   //======= FONT SIZES =======================
//
//   static double heroHeadingFontSize = 40;
//   static double bigFontSize = 22;
//   static double mediumFontSize = 18;
//   static double smallFontSize = 16;
//
//   //======= PADDINGS =======================
//   static double fullPagePaddingHorizontal = 48.0;
//   static double paddingFromTopForAppBar = 488.0;
//
//
//   //======= TEXT STYLES =======================
//
//   static TextStyle nunitoMediumW500 = GoogleFonts.nunito(
//       fontWeight: FontWeight.w500,
//       color: AppTheme.textColor,
//       fontSize: AppConstants.mediumFontSize);
//
//   static TextStyle nunitoSmallW500 = GoogleFonts.nunito(
//       fontWeight: FontWeight.w500,
//       color: AppTheme.textColor,
//       fontSize: AppConstants.smallFontSize);
//
//   static TextStyle nunitoBigPrimaryColorW700 = GoogleFonts.nunito(
//       fontWeight: FontWeight.w700,
//       color: AppTheme.primaryColor,
//       fontSize: bigFontSize
//   );
//
//   static TextStyle nunitoBigWhiteW700 = GoogleFonts.nunito(
//       fontWeight: FontWeight.w700,
//       color: AppTheme.whiteColor,
//       fontSize: heroHeadingFontSize
//   );
//   static TextStyle nunitoMediumWhiteW500 = GoogleFonts.nunito(
//       fontWeight: FontWeight.w500,
//       color: AppTheme.whiteColor,
//       fontSize: bigFontSize
//   );
//
//
//   static TextStyle nunitoMediumPrimaryColorW700 = GoogleFonts.nunito(
//       fontWeight: FontWeight.w700,
//       color: AppTheme.primaryColor,
//       fontSize: mediumFontSize
//   );
//
//
//   static List<ItemsModel> itemLists = [
//     ItemsModel(text: 'Find What You Need and Support Your Community Connections', imagePath: 'assets/images/help_img.png'),
//     ItemsModel(text: 'Discover, Connect, and Grow Together', imagePath: 'assets/images/find_img.png'),
//     ItemsModel(text: 'Your Community Hub for Indian Services', imagePath: 'assets/images/community_discuss_img.png'),
//     ItemsModel(text: 'Bringing Services Closer Connect, Support, and', imagePath: 'assets/images/puzzle_img.png'),
//   ];
//
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/enums/environment_enum.dart';
import 'package:ns_community_support_hub/core/local/models/items_model.dart';

class AppConstants {

  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();



  static String mapApiKey = 'AIzaSyD2wfPAi8BqN1_p9NB2ej5-gRxS-CY80PE';


  //========= DB CONSTANTS ==================================

  /// here database environments can be changed to live,dev
  static final Environment _currentEnvironment = Environment.dev; // Default environment

  // Getter to access the current environment
  static Environment get currentEnvironment => _currentEnvironment;

  // Dynamic getters for database names
  /// ALWAYS USE _ BETWEEN ENVIRONMENT NAME AND DATABASE NAME EX. live_businesses
  static String get firebaseBusinesses => '${_currentEnvironment.name}_businesses';
  static String get firebaseEvents => '${_currentEnvironment.name}_events';
  static String get firebaseImages => '${_currentEnvironment.name}_images';
  //static String get firebaseCommunityEvents => '${_currentEnvironment.name}_community_event';
  static String get firebaseReviewImages => '${_currentEnvironment.name}_review_images';
  static String get firebaseContactForms => '${_currentEnvironment.name}_contact_form';



  //======= FONT SIZES =======================
  static double get heroHeadingFontSize {
    double screenWidth = getScreenWidth();
    if (screenWidth < 600) {
      return 28; // Mobile
    } else if (screenWidth < 1024) {
      return 36; // Tablet
    }
    return 44; // Web
  }

  static double get bigFontSize {
    double screenWidth = getScreenWidth();
    if (screenWidth < 600) {
      return 20; // Mobile
    } else if (screenWidth < 1024) {
      return 24; // Tablet
    }
    return 24; // Web
  }

  static double get mediumFontSize {
    double screenWidth = getScreenWidth();
    if (screenWidth < 600) {
      return 16; // Mobile
    } else if (screenWidth < 1024) {
      return 20; // Tablet
    }
    return 24; // Web
  }

  static double get smallFontSize {
    double screenWidth = getScreenWidth();
    if (screenWidth < 600) {
      return 14; // Mobile
    } else if (screenWidth < 1024) {
      return 18; // Tablet
    }
    return 22; // Web
  }


  // static double get heroHeadingFontSize {
  //   double screenWidth = getScreenWidth();
  //   if (screenWidth < 600) {
  //     return 30; // Increased from 30 for smaller screens
  //   }
  //   return 40; // Increased from 40 for larger screens
  // }
  //
  // static double get bigFontSize {
  //   double screenWidth = getScreenWidth();
  //   if (screenWidth < 600) {
  //     return 20; // Increased from 18 for smaller screens
  //   }
  //   return 24; // Increased from 22 for larger screens
  // }
  //
  // static double get mediumFontSize {
  //   double screenWidth = getScreenWidth();
  //   if (screenWidth < 600) {
  //     return 16; // Increased from 14 for smaller screens
  //   }
  //   return 20; // Increased from 18 for larger screens
  // }
  //
  // static double get smallFontSize {
  //   double screenWidth = getScreenWidth();
  //   if (screenWidth < 600) {
  //     return 16; // Increased from 12 for smaller screens
  //   }
  //   return 20; // Increased from 16 for larger screens
  // }


  //======= PADDINGS =======================


  static double get fullPagePaddingHorizontal {
    double screenWidth = getScreenWidth();
    if (screenWidth < 600) {
      return 32.0; // Increased padding for better spacing on small screens
    }
    return 112.0; // Default for larger screens
  }


  // static double get fullPagePaddingHorizontal {
  //   double screenWidth = getScreenWidth();
  //   if (screenWidth < 600) {
  //     return 20; // Adjust padding for smaller screens
  //   }
  //   return 68.0; // Default for larger screens
  // }

  static double get paddingFromTopForAppBar {
    double screenWidth = getScreenWidth();
    if (screenWidth < 600) {
      return 200.0; // Adjust for smaller screens
    }
    return 488.0; // Default for larger screens
  }

  //======= TEXT STYLES =======================
  static TextStyle nunitoMediumW500 = GoogleFonts.nunito(
    fontWeight: FontWeight.w500,
    color: AppTheme.textColor,
    fontSize: AppConstants.mediumFontSize,
  );

  static TextStyle nunitoSmallW500 = GoogleFonts.nunito(
    fontWeight: FontWeight.w500,
    color: AppTheme.textColor,
    fontSize: AppConstants.smallFontSize,
  );

  static TextStyle nunitoBigPrimaryColorW700 = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    color: AppTheme.primaryColor,
    fontSize: bigFontSize,
  );

  static TextStyle nunitoBigWhiteW700 = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    color: AppTheme.whiteColor,
    fontSize: heroHeadingFontSize,
  );

  static TextStyle nunitoMediumWhiteW500 = GoogleFonts.nunito(
    fontWeight: FontWeight.w500,
    color: AppTheme.whiteColor,
    fontSize: bigFontSize,
  );

  static TextStyle nunitoMediumPrimaryColorW700 = GoogleFonts.nunito(
    fontWeight: FontWeight.w700,
    color: AppTheme.primaryColor,
    fontSize: mediumFontSize,
  );

  static List<ItemsModel> itemLists = [
    ItemsModel(text: 'Find What You Need and Support Your Community Connections', imagePath: 'assets/images/help_img.png'),
    ItemsModel(text: 'Discover, Connect, and Grow Together', imagePath: 'assets/images/find_img.png'),
    ItemsModel(text: 'Your Community Hub for Indian Services', imagePath: 'assets/images/community_discuss_img.png'),
    ItemsModel(text: 'Bringing Services Closer Connect, Support, and', imagePath: 'assets/images/puzzle_img.png'),
  ];

  // Function to get screen width dynamically
  static double getScreenWidth([BuildContext? context]) {
    if (context != null) {
      final view = View.of(context);
      return view.physicalSize.width;
    }
    return 0; // default value, should not happen if context is passed
  }
}
