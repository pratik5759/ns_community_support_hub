import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/common_widgets/auth_provider.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/common_widgets/log_in_popup.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/core/services/auth_service.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_card.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_search_bar.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';
import 'package:ns_community_support_hub/features/events/presentation/add_event_screen.dart';
import 'package:ns_community_support_hub/features/events/presentation/widgets/events_card.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/home_events_list.dart';
import 'package:provider/provider.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Hero Section with page name
            HeroSectionWithPageName(pageName: LocalStrings.events),
            

            /// GridView without independent scrolling
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.fullPagePaddingHorizontal,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;

                  // Define dynamic column count based on screen width
                  int crossAxisCount;
                  double childAspectRatio;

                  if (screenWidth < 600) { // Mobile screens
                    crossAxisCount = 1;
                    childAspectRatio = 0.9; // Adjust to avoid overly stretched cards
                  } else if (screenWidth < 1024) { // Tablets
                    crossAxisCount = 2;
                    childAspectRatio = 1.0;
                  } else { // Desktops
                    crossAxisCount = 3;
                    childAspectRatio = 1.1;
                  }

                  return GridView.builder(
                    shrinkWrap: true, // Ensures GridView only takes required space
                    physics: const NeverScrollableScrollPhysics(), // Disables GridView scrolling
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20.0, // Reduced for better fit on smaller screens
                      mainAxisSpacing: 20.0,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return EventsCard(
                        event: Event(
                            id: 'id',
                            name: 'Navratri - Dandiya/Garba Nights 2024',
                            description: 'Please come and join us to celebrate Navratri Dandiya / Garba Nights 2024. Please bring your family & friends & Let\'s Play Dandiya and Garba. Navratri is b..',
                            date: 'date',
                            location: 'location',
                            imageUrl: 'imageUrl',
                            organizer: 'organizer'),
                       );
                    },
                  );
                },
              ),
            ),


            /// Footer Bar (Appears after all tiles)
            FooterBar(),
          ],
        ),
      ),
      floatingActionButton: _buildResponsiveFAB(context, 'Add Event', Icons.event, () async {
        bool isLoggedIn = await AuthService().isUserLoggedIn();
        isLoggedIn ? context.go(WebRouteNames.addEvent) : showLoginPopup(context);
      }),
    );
  }

  Widget _buildResponsiveFAB(BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isWeb = screenWidth >= 1024;

    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AppTheme.ctaColor,
      icon: Icon(icon, color: Colors.white),
      label: isMobile ? SizedBox.shrink() : Text(label, style: TextStyle(color: Colors.white, fontSize: isWeb ? 18 : 16)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  void showLoginPopup(BuildContext context) {



    showDialog(
      context: context,
      barrierDismissible: true, // Allows closing the popup when tapping outside
      builder: (BuildContext dialogContext) { // Use a different context for the dialog
        return Dialog(
          backgroundColor: Colors.transparent, // Keeps background outside popup transparent
          child: LoginPopup(
            onCancel: () => context.pop(), // Close dialog using GoRouter
            onLogin: () async {
              context.read<AuthenticationProvider>().signInWithGoogle();
              context.pop(); // Close dialog
              // Perform login action here
            },
          ),
        );
      },
    );
  }


}

