import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/add_business_form.dart';
import 'package:ns_community_support_hub/features/events/presentation/widgets/add_event_form.dart';

class AddBusinessScreen extends StatelessWidget {
  const AddBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSectionWithPageName(clickableText: LocalStrings.businessDirectory,pageName: 'Add Business',onClickableTextTap: () => context.go(WebRouteNames.businessDirectory),),
            AddBusinessForm(),
            FooterBar()
          ],
        ),
      ),
    );
  }

}
