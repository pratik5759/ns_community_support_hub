import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

import '../../../../core/common_widgets/footer_bar.dart';
import '../widgets/faq_p.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        //backgroundColor: AppTheme.primaryColor,
        appBar: CustomAppBar(height: 88),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  HeroSectionWithPageName(pageName: LocalStrings.faqHeading,),
              // LayoutBuilder(
              //   builder: (context, constraints) {
              //     double maxWidth = constraints.maxWidth;
              //     bool isSmallScreen = maxWidth < 900;
              //
              //     return Container(
              //       color: AppTheme.primaryColor,
              //       width: isSmallScreen ? maxWidth : 1680,
              //       // Adjust width
              //       // height: 291,
              //       height: 250,
              //       // Fixed height
              //
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.symmetric(
              //           horizontal: isSmallScreen ? 16 : 32),
              //       // Responsive padding
              //       child: Center(
              //         child: Text(
              //           LocalStrings.faqHeading,
              //           style: TextStyle(
              //             fontSize: isSmallScreen ? 24 : 32,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //           ),
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     );
              //   },
              // ),
                  FAQSection(),

                  SizedBox(height: 60),


                  FooterBar()
            ])));
  }
}
