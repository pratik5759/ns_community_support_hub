/*
import 'package:flutter/material.dart';

class StarRatingBar extends StatelessWidget {
  final double rating; // Average rating out of 5
  final double starSize;
  final Color filledColor;
  final Color emptyColor;

  const StarRatingBar({
    super.key,
    required this.rating,
    this.starSize = 30.0,
    this.filledColor = const Color(0xFF695F9B), // Default filled color
    this.emptyColor = Colors.transparent, // Default non-filled color
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background row with filled stars
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              size: starSize,
              color: filledColor, // Fully colored stars in the background
            );
          }),
        ),

        // Foreground row with transparent stars (Clipped)
        ClipRect(
          clipper: StarClipper(rating, starSize * 5), // Clip based on rating
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                size: starSize,
                color: emptyColor, // Transparent stars overlay
              );
            }),
          ),
        ),
      ],
    );
  }
}

// Clipper to mask the stars based on rating
class StarClipper extends CustomClipper<Rect> {
  final double rating;
  final double totalWidth; // Total width of all stars

  StarClipper(this.rating, this.totalWidth);

  @override
  Rect getClip(Size size) {
    double clipWidth = (rating / 5) * totalWidth;
    return Rect.fromLTRB(clipWidth, 0, totalWidth, size.height);
  }

  @override
  bool shouldReclip(StarClipper oldClipper) {
    return oldClipper.rating != rating;
  }
}
*/



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarRatingBar extends StatelessWidget {
  final double rating; // Rating out of 5
  final double starSize;
  final Color filledColor;
  final Color emptyColor;
  final Color textColor;

  const StarRatingBar({
    super.key,
    required this.rating,
    this.starSize = 20.0,
    this.filledColor = const Color(0xFF695F9B), // Default filled color
    this.emptyColor = Colors.grey, // Grey empty stars (visible)
    this.textColor = Colors.black, // Default text color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Stars
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            double starValue = rating - index;

            if (starValue >= 1) {
              // Fully filled star
              return Icon(Icons.star, size: starSize, color: filledColor);
            } else if (starValue > 0) {
              // Partially filled star using Stack & ClipRect
              return Stack(
                children: [
                  Icon(Icons.star_border, size: starSize, color: emptyColor), // Empty star with border
                  ClipRect(
                    clipper: StarHalfClipper(starValue, starSize),
                    child: Icon(Icons.star, size: starSize, color: filledColor), // Filled part
                  ),
                ],
              );
            } else {
              // Empty star (with border)
              return Icon(Icons.star_border, size: starSize, color: emptyColor);
            }
          }),
        ),
        const SizedBox(width: 5), // Space between stars and text
        // Rating Text
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            rating.toStringAsFixed(1), // Show rating with 1 decimal (e.g., 3.5)
            style: GoogleFonts.nunito(
              fontSize: starSize * 0.8, // Slightly smaller than star size
              fontWeight: FontWeight.bold,
              color: filledColor,
            ),
          ),
        ),
      ],
    );
  }
}

// Clipper to mask the stars for partial filling
class StarHalfClipper extends CustomClipper<Rect> {
  final double fillAmount; // 0.0 to 1.0
  final double starSize;

  StarHalfClipper(this.fillAmount, this.starSize);

  @override
  Rect getClip(Size size) {
    double clipWidth = fillAmount * size.width; // Clip width based on fill amount
    return Rect.fromLTRB(0, 0, clipWidth, size.height);
  }

  @override
  bool shouldReclip(StarHalfClipper oldClipper) {
    return oldClipper.fillAmount != fillAmount;
  }
}



