import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/add_business_form.dart';

import 'package:provider/provider.dart';

class AddBusinessScreen extends StatefulWidget {
  const AddBusinessScreen({super.key});

  @override
  State<AddBusinessScreen> createState() => _AddBusinessScreenState();
}

class _AddBusinessScreenState extends State<AddBusinessScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(()  {
      context.read<BusinessDirectoryProvider>().loadUserData();
       context.read<BusinessDirectoryProvider>().loadCategories();
       context.read<BusinessDirectoryProvider>().loadCategories();

    });
      // Load data using `read`
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    context.read<BusinessDirectoryProvider>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(scaffoldKey: AppConstants.scaffoldKey,),
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
