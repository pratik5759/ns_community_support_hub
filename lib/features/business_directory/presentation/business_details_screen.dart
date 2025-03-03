import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/auth_provider.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/common_widgets/log_in_popup.dart';
import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_clickable.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_asstes/local_assets.dart';

import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/core/services/auth_service.dart';
import 'package:ns_community_support_hub/features/business_directory/business_directory_provider.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_para.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_related_section.dart';
import 'package:ns_community_support_hub/features/pageNotFound404/presentation/page_not_found_screen.dart';
import 'package:provider/provider.dart';
 import 'dart:html' as html;
import 'dart:async';



import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'dart:html'
    as html; // TODO: removed this comment during android app build
import 'package:flutter/services.dart';

class BusinessDetailScreen extends StatefulWidget {
  BusinessDetailScreen({super.key});

  @override
  State<BusinessDetailScreen> createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
  String? businessId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<BusinessDirectoryProvider>();
      businessId = GoRouterState.of(context).pathParameters['id'];
      print('Business Id: $businessId');

      if (businessId != null) {
        if (provider.allBusinesses.isEmpty) {
          print('Business list is empty! Fetching now...');
          provider.loadBusinesses().then((_) {
            print('✅ Businesses loaded. Fetching business by ID...');
            provider.getBusinessById(businessId!);
          });
        } else {
          provider.getBusinessById(businessId!);
        }
      }
    });
  }
  double? latitude;
  double? longitude;

  XFile? _imageFile;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  String? _imageUrl;

//  LatLng? _location;
  XFile? _image;
  //
  // Future<void> _pickImageAndroid() async {
  //   final XFile? pickedFile =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = pickedFile;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(scaffoldKey: AppConstants.scaffoldKey),
      body: Consumer<BusinessDirectoryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.businessDetails == null) {
            return PageNotFoundScreen();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                HeroSectionWithPageName(
                  pageName: provider.businessDetails!.name,
                  onClickableTextTap: () => context.go(WebRouteNames.businessDirectory),
                  clickableText: LocalStrings.businessDirectory,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = constraints.maxWidth;
                    bool isSmallScreen = maxWidth < 900;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
                              child: BusinessDetailsSection(business: provider.businessDetails!),
                            ),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            flex: isSmallScreen ? 1 : 2,
                            child: Image.network(
                              provider.businessDetails!.image,
                              width: 600,
                              height: 300,
                              fit: BoxFit.fitHeight,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/image_not_available_img.png',
                                  width: 600,
                                  height: 300,
                                  fit: BoxFit.fitHeight,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                RelatedBusinessSection(),
                const SizedBox(height: 40),
                FooterBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}











