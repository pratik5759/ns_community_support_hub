import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:provider/provider.dart';

class StarRating extends StatefulWidget {
  //final double rating; // Rating out of 5

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
    this.showNumericRating = true, //required this.rating,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessDirectoryProvider>(
        builder: (context, ratingProvider, child) {
          double rate = ratingProvider.rating; // Get current rating
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Star Rating Row
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.starCount, (index) {
                  double starValue = index + 1.0;
                  double fillAmount = rate - index;
                  bool isFullStar = rate >= starValue;
                  bool isHalfStar = widget.allowHalfRating && rate >= (starValue - 0.5) && rate < starValue;


                  return GestureDetector(
                    onTap: () => ratingProvider.setRating(starValue),
                    onDoubleTap: () {
                      if (widget.allowHalfRating) {
                        ratingProvider.setRating(starValue - 0.5);
                      }
                    },
                    child: Icon(
                      isFullStar
                          ? Icons.star
                          : isHalfStar
                          ? Icons.star_half
                          : Icons.star_border,
                      size: widget.starSize,
                      color: isFullStar || isHalfStar ? widget.filledColor : widget.emptyColor,
                    ),
                  );

                  // return GestureDetector(
                  //   onTapDown: (details) {
                  //     RenderBox box = context.findRenderObject() as RenderBox;
                  //     double dx = box.globalToLocal(details.globalPosition).dx;
                  //     double widthPerStar = box.size.width;
                  //     double relativePosition = dx / widthPerStar;
                  //
                  //     double value = starValue;
                  //     if (allowHalfRating && relativePosition < 0.5) {
                  //       value -= 0.5;
                  //     }
                  //
                  //     ratingProvider.setRating(value);
                  //   },
                  //   child: Stack(
                  //     children: [
                  //       Icon(Icons.star_border, size: starSize, color: emptyColor), // Empty star
                  //       if (fillAmount > 0)
                  //         ClipRect(
                  //           clipper: StarHalfClipper(fillAmount.clamp(0.0, 1.0), starSize),
                  //           child: Icon(Icons.star, size: starSize, color: filledColor), // Filled part
                  //         ),
                  //     ],
                  //   ),
                  // );

                  //
                  // return GestureDetector(
                  //   onTap: () => ratingProvider.setRating(starValue),
                  //   onDoubleTap: () =>
                  //   allowHalfRating
                  //       ? ratingProvider.setRating(starValue - 0.5)
                  //       : null,
                  //   child: Stack(
                  //     children: [
                  //       Icon(Icons.star_border, size: starSize,
                  //           color: emptyColor), // Empty star
                  //       if (fillAmount > 0)
                  //         ClipRect(
                  //           clipper: StarHalfClipper(
                  //               fillAmount.clamp(0.0, 1.0), starSize),
                  //           child: Icon(Icons.star, size: starSize,
                  //               color: filledColor), // Filled part
                  //         ),
                  //     ],
                  //   ),
                  // );
                }),
              ),
              const SizedBox(height: 5),
              // Numeric Rating Display
              if (widget.showNumericRating)
                Text(
                  rate.toStringAsFixed(1),
                  // Show rating with 1 decimal (e.g., 4.5)
                  style: TextStyle(fontSize: widget.starSize * 0.8,
                      fontWeight: FontWeight.bold,
                      color: widget.filledColor),
                ),
            ],
          );
        }
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