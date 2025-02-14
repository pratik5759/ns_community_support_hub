import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_card.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/widgets/business_search_bar.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';
import 'package:ns_community_support_hub/features/events/presentation/widgets/events_card.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/widgets/home_events_list.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

