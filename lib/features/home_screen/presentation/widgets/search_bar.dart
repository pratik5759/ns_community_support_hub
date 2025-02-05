import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class CustomSearchBar extends StatefulWidget {

  double height;
  double width;

   CustomSearchBar({super.key,required this.height,required this.width});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
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
            width: widget.width * 0.08,
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
            width: widget.width * 0.71,
            decoration: BoxDecoration(
                color: Colors.white,
               /* borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32)
                )*/
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
            width: widget.width * 0.20,
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
