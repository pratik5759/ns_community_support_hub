

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/models/items_model.dart';

class AppConstants{
  //======= FONT SIZES =======================

  static double heroHeadingFontSize = 40;
  static double bigFontSize = 22;
  static double mediumFontSize = 18;
  static double smallFontSize = 16;

  //======= PADDINGS =======================
  static double fullPagePaddingHorizontal = 48.0;
  static double paddingFromTopForAppBar = 488.0;


  //======= TEXT STYLES =======================

  static TextStyle nunitoMediumW500 = GoogleFonts.nunito(
      fontWeight: FontWeight.w500,
      color: AppTheme.textColor,
      fontSize: AppConstants.mediumFontSize);

  static TextStyle nunitoSmallW500 = GoogleFonts.nunito(
      fontWeight: FontWeight.w500,
      color: AppTheme.textColor,
      fontSize: AppConstants.smallFontSize);

  static TextStyle nunitoBigPrimaryColorW700 = GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      color: AppTheme.primaryColor,
      fontSize: bigFontSize
  );

  static TextStyle nunitoBigWhiteW700 = GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      color: AppTheme.whiteColor,
      fontSize: heroHeadingFontSize
  );
  static TextStyle nunitoMediumWhiteW500 = GoogleFonts.nunito(
      fontWeight: FontWeight.w500,
      color: AppTheme.whiteColor,
      fontSize: bigFontSize
  );


  static TextStyle nunitoMediumPrimaryColorW700 = GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      color: AppTheme.primaryColor,
      fontSize: mediumFontSize
  );


  static List<ItemsModel> itemLists = [
    ItemsModel(text: 'Find What You Need and Support Your Community Connections', imagePath: 'assets/images/help_img.png'),
    ItemsModel(text: 'Discover, Connect, and Grow Together', imagePath: 'assets/images/find_img.png'),
    ItemsModel(text: 'Your Community Hub for Indian Services', imagePath: 'assets/images/community_discuss_img.png'),
    ItemsModel(text: 'Bringing Services Closer Connect, Support, and', imagePath: 'assets/images/puzzle_img.png'),
  ];

}
