import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';

class HeroSectionWithPageName extends StatelessWidget {
  final String pageName;

  const HeroSectionWithPageName({
    super.key,
    required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryColor,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: LayoutBuilder(
          builder: (context, constraints) {

            double maxWidth = constraints.maxWidth;
            double maxHeight = constraints.maxHeight;

            return Padding(
              padding: const EdgeInsets.only(top: 120, bottom: 60),
              child: Center(
                child: Text(
                  pageName,
                  style: AppConstants.nunitoMediumWhiteW500
                      .copyWith(fontWeight: FontWeight.bold,),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
