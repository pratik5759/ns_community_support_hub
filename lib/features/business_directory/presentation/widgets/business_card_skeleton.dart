import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BusinessCardSkeleton extends StatelessWidget {
  const BusinessCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallScreen = screenWidth < 600;
    bool isMediumScreen = screenWidth >= 600 && screenWidth < 1024;

    double containerWidth = isSmallScreen
        ? screenWidth * 0.9
        : isMediumScreen
        ? screenWidth * 0.4
        : 300;
    double containerHeight = isSmallScreen ? 380 : 450;

    double imageWidth = isSmallScreen ? containerWidth * 0.9 : 416;
    double imageHeight = isSmallScreen ? 180 : 200;

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.3),
            offset: const Offset(8, 12),
            blurRadius: 24,
            spreadRadius: -8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: imageWidth,
              height: imageHeight,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: containerWidth * 0.6,
              height: 20,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 6),
            Container(
              width: containerWidth * 0.8,
              height: 14,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 4),
            Container(
              width: containerWidth * 0.5,
              height: 14,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 28),
            Container(
              width: 100,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
