
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/events/events_provider.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';
import 'package:provider/provider.dart';

class HomeEventsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;


    double containerWidth = screenWidth * 0.28;
    double containerHeight = containerWidth * 1.18;


    bool isSmallScreen = screenWidth < 600; // Small screen threshold
    if (isSmallScreen) {
      containerWidth = screenWidth * 0.64; // Wider containers on small screens
       containerHeight =
          containerWidth * 1.2; // Adjust container height for smaller screens
    }


    return Container(
      height: containerHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.fullPagePaddingHorizontal),
        child: Consumer<EventProvider>(builder: (context, value, child) {
          DateTime currentDate = DateTime.now();
          String todayStr = "${currentDate.year}-${currentDate.month}-${currentDate.day}";



        //  Categorize events based on the `date` field
          List<EventsModel> upcomingEvents = value.allEvents.where((event) {
          DateTime? eventDate = DateTime.tryParse(event.date);
          return eventDate != null && eventDate.isAfter(currentDate);
          }).toList();

          List<EventsModel> ongoingEvents = value.allEvents.where((event) {
          return event.date == todayStr; // If event.date matches today's date
          }).toList();

          List<EventsModel> completedEvents = value.allEvents.where((event) {
          DateTime? eventDate = DateTime.tryParse(event.date);
          return eventDate != null && eventDate.isBefore(currentDate);
          }).toList();

          // Show upcoming events first, then ongoing, then completed
          List<EventsModel> displayEvents = upcomingEvents.isNotEmpty
          ? upcomingEvents
              : ongoingEvents.isNotEmpty
          ? ongoingEvents
              : completedEvents;


          return displayEvents.isNotEmpty
          ? SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enables horizontal scrolling
            child: Row(
              children: displayEvents.map((event) {
                return Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: EventsListCard(event: event),
                );
              }).toList(),
            ),

          )
              : Text(
              "Not Selected Image ",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              );
        }),
      ),
    );


  }
}

class EventsListCard extends StatelessWidget {
  final EventsModel event;

  const EventsListCard({
    super.key,
    required this.event,
    this.imageHeight,
    this.imageWidth,
  });


  final double? imageHeight;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;


     bool isSmallScreen = screenWidth < 600;

    return Center(
      child: FittedBox(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: 448,
          // Fixed width
          height: 448,
          // Fixed height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(8, 12),
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
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      event.imageUrl,
                      width: 400,
                      height: 180,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/image_not_available_img.png',
                          width: 412,
                          height: 180,
                          fit: BoxFit.fitWidth,
                        );
                      },
                    ),
                  ),
                ),

                 const SizedBox(height: 10),
                Text(
                  event.name,
                  style: AppConstants.nunitoMediumW500.copyWith(
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Text(
                    event.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppConstants.nunitoMediumW500.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        context.go(WebRouteNames.eventsDetails, extra: event);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          LocalStrings.viewMore,
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: AppConstants.mediumFontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


