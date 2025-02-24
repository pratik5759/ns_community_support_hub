import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:provider/provider.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double starSize;
  final Color filledColor;
  final Color emptyColor;
  final bool allowHalfRating;
  final bool showNumericRating;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.starSize = 32.0,
    this.filledColor = const Color(0xFF695F9B), // Default filled color
    this.emptyColor = Colors.grey,
    this.allowHalfRating = true,
    this.showNumericRating = true,
  });

  @override
  Widget build(BuildContext context) {
    final ratingProvider = Provider.of<BusinessDirectoryProvider>(context);
    double rating = ratingProvider.rating; // Get current rating

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Star Rating Row
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(starCount, (index) {
            double starValue = index + 1.0;
            double fillAmount = rating - index;

            return GestureDetector(
              onTap: () => ratingProvider.setRating(starValue),
              onDoubleTap: () => allowHalfRating ? ratingProvider.setRating(starValue - 0.5) : null,
              child: Stack(
                children: [
                  Icon(Icons.star_border, size: starSize, color: emptyColor), // Empty star
                  if (fillAmount > 0)
                    ClipRect(
                      clipper: StarHalfClipper(fillAmount.clamp(0.0, 1.0), starSize),
                      child: Icon(Icons.star, size: starSize, color: filledColor), // Filled part
                    ),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 5),
        // Numeric Rating Display
        if (showNumericRating)
          Text(
            rating.toStringAsFixed(1), // Show rating with 1 decimal (e.g., 4.5)
            style: TextStyle(fontSize: starSize * 0.8, fontWeight: FontWeight.bold, color: filledColor),
          ),
      ],
    );
  }
}

// Clipper for half-stars
class StarHalfClipper extends CustomClipper<Rect> {
  final double fillAmount;
  final double starSize;

  StarHalfClipper(this.fillAmount, this.starSize);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, fillAmount * size.width, size.height);
  }

  @override
  bool shouldReclip(StarHalfClipper oldClipper) {
    return oldClipper.fillAmount != fillAmount;
  }
}
