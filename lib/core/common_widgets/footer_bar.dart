// import 'package:flutter/material.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class FooterBar extends StatefulWidget {
//    FooterBar({super.key,
//     this.height = 240
//   });
//   double height ;
//
//   @override
//   State<FooterBar> createState() => _FooterBarState();
// }
//
// class _FooterBarState extends State<FooterBar> {
//
//   TextStyle textStyle = AppConstants.nunitoSmallW500.copyWith(color: Colors.white);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: widget.height,
//       width: double.infinity,
//       color: AppTheme.primaryColor,
//       child: SizedBox(
//         height: widget.height * 0.75,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//
//               const SizedBox(
//                  height: 16,
//               ),
//
//               /// footer website name
//               InkWell(
//                 onTap: () {
//
//                 },
//                 child: Text(
//                   LocalStrings.websiteName,
//                   style: AppConstants.nunitoBigPrimaryColorW700.copyWith(color: Colors.white),
//                 ),
//               ),
//
//               const SizedBox(
//                 height: 20,
//               ),
//
//
//               /// footer nav text
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   /// company and below section
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       InkWell(
//                         onTap: () {
//
//                         },
//                         child: Text(
//                           LocalStrings.company,
//                           style: textStyle,
//                         ),
//                       ),
//
//                       InkWell(
//                         onTap: () {
//
//                         },
//                         child: Text(
//                           LocalStrings.faq,
//                           style: textStyle,
//                         ),
//                       ),
//
//                       InkWell(
//                         onTap: () {
//
//                         },
//                         child: Text(
//                           LocalStrings.privacyPolicy,
//                           style: textStyle,
//                         ),
//                       ),
//
//                       InkWell(
//                         onTap: () {
//
//                         },
//                         child: Text(
//                           LocalStrings.termsConditions,
//                           style: textStyle,
//                         ),
//                       ),
//
//                     ],
//                   ),
//
//                   /// support section
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//
//                       Text(
//                         LocalStrings.support,
//                         style: textStyle,
//                       ),
//
//
//                       Text(
//                         LocalStrings.aboutUs,
//                         style: textStyle,
//                       ),
//
//                       Text(
//                         LocalStrings.helpCenter,
//                         style: textStyle,
//                       ),
//
//                       /// empty text to manage alignemnt
//                       // const Text(
//                       //   '',
//                       //   //style: textStyle,
//                       // ),
//                       // const Text(
//                       //   '',
//                       //   //style: textStyle,
//                       // ),
//
//
//                     ],
//                   ),
//
//
//                   /// social media section
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//
//                       Text(
//                         LocalStrings.socialMedia,
//                         style: textStyle,
//                       ),
//
//                       Row(
//                         spacing: 8,
//                         children: [
//                           Image.asset('assets/icons/facebook_ic.png'),
//                           Image.asset('assets/icons/instagram_ic.png'),
//                           Image.asset('assets/icons/linkedin_ic.png'),
//                           Image.asset('assets/icons/x_ic.png'),
//                           Image.asset('assets/icons/youtube_ic.png')
//                         ],
//                       ),
//
//                       /// empty text to manage alignemnt
//                       const Text(
//                         '',
//                         //style: textStyle,
//                       ),
//                       const Text(
//                         '',
//                         //style: textStyle,
//                       ),
//
//
//                     ],
//                   )
//
//                 ],
//               ),
//
//               const SizedBox(
//                 height: 20,
//               ),
//
//               Center(
//                 child: Text(
//                   LocalStrings.allRightsReserved,
//                   style: textStyle,
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   LocalStrings.designedDeveloped,
//                   style: textStyle,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';

class FooterBar extends StatefulWidget {
  const FooterBar({super.key});

  @override
  State<FooterBar> createState() => _FooterBarState();
}

class _FooterBarState extends State<FooterBar> {
  TextStyle textStyle =
  AppConstants.nunitoSmallW500.copyWith(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.height * 0.35; // Adjust height dynamically
    double paddingHorizontal = size.width * 0.05; // Adjust padding
    double spacing = size.width * 0.01; // Adjust spacing dynamically

    return Container(
      height: height,
      width: double.infinity,
      color: AppTheme.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.1),
            InkWell(
              onTap: _onWebsiteTap,
              child: Text(
                LocalStrings.websiteName,
                style: AppConstants.nunitoBigPrimaryColorW700
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: spacing * 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildColumn([
                  {'text': LocalStrings.company, 'onTap': _onCompanyTap},
                  {'text': LocalStrings.faq, 'onTap': _onFaqTap},
                  {'text': LocalStrings.privacyPolicy, 'onTap': _onPrivacyTap},
                  {'text': LocalStrings.termsConditions, 'onTap': _onTermsTap},
                ]),
                _buildColumn([
                  {'text': LocalStrings.support, 'onTap': _onSupportTap},
                  {'text': LocalStrings.aboutUs, 'onTap': _onAboutUsTap},
                  {'text': LocalStrings.helpCenter, 'onTap': _onHelpCenterTap},
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LocalStrings.socialMedia, style: textStyle),
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        _buildSocialIcon(
                            'assets/icons/facebook_ic.png', _onFacebookTap),
                        _buildSocialIcon(
                            'assets/icons/instagram_ic.png', _onInstagramTap),
                        _buildSocialIcon(
                            'assets/icons/linkedin_ic.png', _onLinkedInTap),
                        _buildSocialIcon(
                            'assets/icons/x_ic.png', _onTwitterTap),
                        _buildSocialIcon(
                            'assets/icons/youtube_ic.png', _onYouTubeTap),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            //SizedBox(height: spacing * 0.5),
            Center(child: Text(LocalStrings.allRightsReserved, style: textStyle)),
            Center(child: Text(LocalStrings.designedDeveloped, style: textStyle)),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: item['onTap'],
          child: Text(item['text'], style: textStyle),
        ),
      ))
          .toList(),
    );
  }

  Widget _buildSocialIcon(String assetPath, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(assetPath, width: 24, height: 24),
      ),
    );
  }

  void _onWebsiteTap() {}
  void _onCompanyTap() {}
  void _onFaqTap() {}
  void _onPrivacyTap() {}
  void _onTermsTap() {}
  void _onSupportTap() {}
  void _onAboutUsTap() {}
  void _onHelpCenterTap() {}
  void _onFacebookTap() {}
  void _onInstagramTap() {}
  void _onLinkedInTap() {}
  void _onTwitterTap() {}
  void _onYouTubeTap() {}
}