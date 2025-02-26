import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';
import 'package:ns_community_support_hub/features/events/presentation/widgets/event_details_widget.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key, required this.event});
  final EventsModel event;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Hero Section with page name
            HeroSectionWithPageName(pageName: LocalStrings.eventDetails),

            /// event detailed card
            EventDetailsWidget(event: EventsModel(id: widget.event.id,
                name: widget.event.name,
                 description: widget.event.description,
                 date: widget.event.date,
                location:  widget.event.location,
                imageUrl: widget.event.imageUrl,
                organizer: widget.event.organizer),),
            
            /// Footer Bar (Appears after all tiles)
            FooterBar(),
          ],
        ),
      ),
    );
  }
}
