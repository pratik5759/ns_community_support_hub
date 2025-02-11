/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class BusinessSearchBar extends StatefulWidget {

  double height;
  double width;

  BusinessSearchBar({super.key,required this.height,required this.width});

  @override
  State<BusinessSearchBar> createState() => _BusinessSearchBarState();
}

class _BusinessSearchBarState extends State<BusinessSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(8, 12),
              blurRadius: 24,
              spreadRadius: -8,
            ),
          ]
      ),
      child: Row(
        children: [

          /// search icon
          Container(
            height: widget.height,
            width: widget.width * 0.04,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Icon(Icons.search),
            ),
          ),

          /// search textfeild
          Container(
            height: widget.height,
            width: widget.width * 0.82,
            decoration: BoxDecoration(
              color: Colors.white,
              */
/* borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32)
                )*//*

            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: LocalStrings.searchBarHint,
                    hintStyle: GoogleFonts.nunito(

                    )
                ),
              ),
            ),
          ),

          /// search button
          Container(
            height: widget.height,
            width: widget.width * 0.08,
            decoration: BoxDecoration(
                color: AppTheme.ctaColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomRight: Radius.circular(32)
                )
            ),
            child: Center(child: Text(LocalStrings.search,style: GoogleFonts.nunito(fontSize: AppConstants.mediumFontSize,color: Colors.white),)),
          ),

        ],
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class BusinessSearchBar extends StatefulWidget {
  final double height;
  final double width;

  const BusinessSearchBar({super.key, required this.height, required this.width});

  @override
  State<BusinessSearchBar> createState() => _BusinessSearchBarState();
}

class _BusinessSearchBarState extends State<BusinessSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.fullPagePaddingHorizontal,vertical: 8),
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32), // Rounded corners for the whole bar
          boxShadow: [
            /*BoxShadow(
              color: Colors.black54,
              offset: Offset(widget.width * 0.02, widget.height * 0.1),
              blurRadius: widget.width * 0.05,
              spreadRadius: widget.width * 0.005,
            ),*/
            BoxShadow(
              color: Colors.black54,
              offset: Offset(8, 12),
              blurRadius: 24,
              spreadRadius: -8,
            ),
          ],
        ),
        child: Row(
          children: [
            /// Search Icon
            const Icon(Icons.search, size: 24, color: Colors.grey),

            /// Search TextField (Takes most of the space)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: LocalStrings.searchBarHint,
                    hintStyle: GoogleFonts.nunito(),
                  ),
                ),
              ),
            ),

            /// Search Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.ctaColor,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24), // Smooth rounded button
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              onPressed: () {
                // TODO: Implement search action
              },
              child: Text(
                LocalStrings.search,
                style: GoogleFonts.nunito(
                  fontSize: AppConstants.mediumFontSize,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


