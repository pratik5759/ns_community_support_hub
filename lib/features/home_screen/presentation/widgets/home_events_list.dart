// /*import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_display.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
//
// class HomeEventsList extends StatelessWidget {
//   Widget build(BuildContext context) {
//     // Get screen width from MediaQuery
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     // Calculate the container width for equal distribution of items
//     double containerWidth = screenWidth * 0.28; // Divide by number of items in a row (4 in this case)
//     double containerHeight = containerWidth * 1.06; // Divide by number of items in a row (4 in this case)
//     // double containerWidth = 480; // Divide by number of items in a row (4 in this case)
//     double imageHeight = containerHeight * 0.5; // Fixed height for images on web
//     double imageWidth = containerWidth; // Fixed height for images on web
//     double textWidth =
//         containerWidth * 0.8; // Text width proportional to the container width
//
//     return Container(
//
//       //height: 432,
//       height: containerHeight,
//       // width: screenWidth * 0.90, // Adjusted based on content
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(
//             3, // Show only 4 items in a row
//                 (index) => EventsListCard(
//               businessName: 'Demo Events',
//               containerWidth: containerWidth,
//               imageHeight: imageHeight,
//               index: index,
//               containerHeight: containerHeight,
//               imageWidth: imageWidth,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class EventsListCard extends StatelessWidget {
//
//   EventsListCard({
//     super.key,
//     required this.containerWidth,
//     required this.imageHeight,
//     required this.index,
//     required this.containerHeight,
//     required this.imageWidth,
//     required this.businessName,
//   });
//
//   final String businessName;
//
//   final double containerWidth;
//   final double imageHeight;
//   final double imageWidth;
//   final double containerHeight;
//   int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       width: containerWidth,
//       //height: 432,
//       height: containerHeight,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black54,
//               offset: Offset(8, 12),
//               blurRadius: 24,
//               spreadRadius: -8,
//             ),
//           ]),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
//         child: Column(
//           //mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: 10,
//           children: [
//             Center(
//               child: Container(
//                 width: containerWidth,
//                 height: containerWidth * 0.5,
//
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/demo_event_img.png'),
//                     fit: BoxFit.fill,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             Text(
//               businessName,
//               //textAlign: TextAlign.center,
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: 16, // Fixed font size for web
//               ),
//             ),
//             Text(
//               'Capture the essence of life\'s moments with stunning visuals! We specialize in professional video and photography services for events, corporate projects ',
//               //textAlign: TextAlign.center,
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: 16, // Fixed font size for web
//               ),
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//             Container(
//               width: containerWidth * 0.28,
//               decoration: BoxDecoration(
//                   color: AppTheme.primaryColor, borderRadius: BorderRadius.circular(8)),
//               child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Text(
//                       LocalStrings.viewMore,
//                       style: GoogleFonts.nunito(
//                           color: Colors.white,
//                           //fontWeight: FontWeight.bold,
//                           fontSize: AppConstants.mediumFontSize),
//                     ),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }*/
//
//
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/features/events/events_provider.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';
import 'package:ns_community_support_hub/features/home_screen/home_provider.dart';
import 'package:provider/provider.dart';

class HomeEventsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Get screen width from MediaQuery

    // Calculate the container width for equal distribution of items
    double containerWidth = screenWidth * 0.28;
    double containerHeight = containerWidth * 1.18;

    // Dynamic image dimensions based on container size
    // double imageWidth = containerWidth * 0.9;  // 90% of the container width
    // double imageHeight = containerHeight * 0.6; // 60% of the container height

    // Determine if the screen is small and adjust layout accordingly
    bool isSmallScreen = screenWidth < 600; // Small screen threshold
    if (isSmallScreen) {
      containerWidth = screenWidth * 0.64; // Wider containers on small screens
      //imageHeight = 150; // Smaller images for small screens
      containerHeight =
          containerWidth * 1.2; // Adjust container height for smaller screens
    }
    // // Calculate the container width for equal distribution of items
    // double containerWidth = screenWidth * 0.28;
    // double containerHeight = containerWidth * 1.2;
    // double imageHeight = containerHeight * 0.5;
    // double imageWidth = containerWidth;
    // double textWidth = containerWidth * 0.8;
    //
    // // Check for small screens and adjust layout accordingly
    // bool isSmallScreen = screenWidth < 600; // Define small screen threshold
    // if (isSmallScreen) {
    //   containerWidth = screenWidth * 0.45; // Wider containers on small screens
    //   imageHeight = 150; // Smaller images for small screens
    //   containerHeight =
    //       containerWidth * 1.2; // Adjust container height for smaller screens
    // }

    return Container(
      height: containerHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.fullPagePaddingHorizontal),
        child: Consumer<EventProvider>(builder: (context, value, child) {
          DateTime currentDate = DateTime.now();
          String todayStr = "${currentDate.year}-${currentDate.month}-${currentDate.day}";

          // Filter upcoming events
          // List<EventsModel> upcomingEvents = value.allEvents.where((event) {
          //   DateTime? eventDate =
          //       DateTime.tryParse(event.date); // Ensure proper parsing
          //   return eventDate != null && eventDate.isAfter(currentDate);
          // }).toList();


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
              "",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              );
        }),
      ),
    );

    // return Container(
    //   height: containerHeight,
    //   child: Padding(
    //     padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: List.generate(
    //         3, // Show only 3 items in a row
    //             (index) => EventsListCard(
    //           businessName: 'Demo Event',
    //         ),
    //       ),
    //     ),
    //   ),
    // );
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

  // final String businessName;
  //final EventsModel event;
  final double? imageHeight;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //
    // double defaultContainerWidth = screenWidth * 0.28;
    // double defaultContainerHeight = defaultContainerWidth * 1.18;
    // double defaultImageHeight = defaultContainerHeight * 0.5;
    // double defaultImageWidth = defaultContainerWidth;

    // Adjust layout for small screens
    bool isSmallScreen = screenWidth < 600;
    // if (isSmallScreen) {
    //   defaultContainerWidth = screenWidth * 0.45;
    //   defaultImageHeight = 150;
    //   defaultContainerHeight = defaultContainerWidth * 1.2;
    // }
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

                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Image.network(
                //     event.imageUrl,
                //     width: imageWidth ?? defaultImageWidth,
                //     height: imageHeight ?? defaultImageHeight,
                //
                //     fit: BoxFit.cover,
                //     errorBuilder: (context, error, stackTrace) => Icon(
                //       Icons.broken_image,
                //       size: defaultImageWidth * 0.6,
                //       color: Colors.grey,
                //     ),
                //   ),
                // ),

                // Center(
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: Image.network(
                //       widget.event.imageUrl,
                //       width: 370,
                //       height: 180,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
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

// class EventsListCard extends StatelessWidget {
//   EventsListCard({
//     super.key,
//     required this.containerWidth,
//     required this.imageHeight,
//     required this.index,
//     required this.containerHeight,
//     required this.imageWidth,
//     required this.businessName,
//   });
//
//   final String businessName;
//   final double containerWidth;
//   final double imageHeight;
//   final double imageWidth;
//   final double containerHeight;
//   int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       width: containerWidth,
//       height: containerHeight,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black54,
//             offset: Offset(8, 12),
//             blurRadius: 24,
//             spreadRadius: -8,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: 10,
//           children: [
//             Center(
//               child: Container(
//                 width: containerWidth,
//                 height: imageHeight,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/demo_event_img.png'),
//                     fit: BoxFit.fill,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             Text(
//               businessName,
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: 16, // Fixed font size for web
//               ),
//             ),
//             Text(
//               'Capture the essence of life\'s moments with stunning visuals! We specialize in professional video and photography services for events, corporate projects.',
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: 16, // Fixed font size for web
//               ),
//             ),
//             const SizedBox(
//               height: 6,
//             ),
//             Container(
//               width: containerWidth * 0.28,
//               decoration: BoxDecoration(
//                 color: AppTheme.primaryColor,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Text(
//                     LocalStrings.viewMore,
//                     style: GoogleFonts.nunito(
//                       color: Colors.white,
//                       fontSize: AppConstants.mediumFontSize,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/features/events/events_provider.dart';
// import 'package:ns_community_support_hub/features/events/models/event_model.dart';
// import 'package:provider/provider.dart';
//
// class HomeEventsList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Container(
//       height: 300, // Adjust height as needed
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal),
//         child: Consumer<EventProvider>(
//           builder: (context, eventProvider, child) {
//             if (eventProvider.isLoading) {
//               return Center(child: CircularProgressIndicator());
//             }
//
//             if (eventProvider.allEvents.isEmpty) {
//               return Center(child: Text("No events available"));
//             }
//
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: eventProvider.allEvents.map((event) {
//                   return Padding(
//                     padding: EdgeInsets.only(right: 10),
//                     child: EventsListCard(event: event),
//                   );
//                 }).toList(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
//
// class EventsListCard extends StatelessWidget {
//   final EventsModel event;
//
//   EventsListCard({required this.event});
//
//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Container(
//           width: 450, // Adjust card width
//           padding: EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Event Image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   event.imageUrl,
//                   height: 120,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 120),
//                 ),
//               ),
//               SizedBox(height: 8),
//               // Event Name
//               Text(
//                 event.name,
//                 style:  AppConstants.nunitoMediumW500.copyWith(
//                  fontSize: 16, // Fixed font size for web
//              ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(height: 4),
//               // Event Date & Location
//               Text(
//                 "${event.date} • ${event.location} ",
//                 style:  AppConstants.nunitoMediumW500.copyWith(
//                   fontSize: 16, // Fixed font size for web
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(height: 4),
//               Text(
//                 "${event.organizer} ",
//                 style:  AppConstants.nunitoMediumW500.copyWith(
//                   fontSize: 16, // Fixed font size for web
//                 ),                maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(height: 4),
//               Text(
//                 "${event.description}",
//                 style:  AppConstants.nunitoMediumW500.copyWith(
//                   fontSize: 16, // Fixed font size for web
//                 ),                maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//

//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
// import 'package:ns_community_support_hub/features/events/events_provider.dart';
// import 'package:ns_community_support_hub/features/events/models/event_model.dart';
// import 'package:ns_community_support_hub/features/home_screen/home_provider.dart';
// import 'package:provider/provider.dart';
//
// class HomeEventsList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     double containerWidth = screenWidth * 0.28;
//     double containerHeight = containerWidth * 1.5;
//     double imageHeight = containerHeight * 0.5;
//
//     bool isSmallScreen = screenWidth < 600;
//     if (isSmallScreen) {
//       containerWidth = screenWidth * 0.45;
//       imageHeight = 150;
//       containerHeight = containerWidth * 1.5;
//     }
//
//     return Container(
//       height: containerHeight,
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: AppConstants.fullPagePaddingHorizontal),
//         child: Consumer<EventProvider>(
//           builder: (context, value, child) {
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: value.allEvents.map((event) {
//                   return Padding(
//                     padding: EdgeInsets.only(right: 10),
//                     child: EventsListCard(event: event),
//                   );
//                 }).toList(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class EventsListCard extends StatefulWidget {
//   const EventsListCard({
//     super.key,
//     required this.event,
//   });
//
//   final EventsModel event;
//
//   @override
//   State<EventsListCard> createState() => _EventsListCardState();
// }
//
// class _EventsListCardState extends State<EventsListCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FittedBox(
//         child: Container(
//           margin: const EdgeInsets.all(8.0),
//           width: 448,
//           height: 500,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.white,
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black54,
//                 offset: Offset(8, 12),
//                 blurRadius: 24,
//                 spreadRadius: -8,
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Event Image
//                 Center(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.network(
//                       widget.event.imageUrl,
//                       width: 370,
//                       height: 180,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) => Icon(
//                         Icons.broken_image,
//                         size: 100,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Event Name
//                 Text(
//                   widget.event.name,
//                   style: AppConstants.nunitoMediumW500.copyWith(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//
//                 const SizedBox(height: 6),
//
//                 // Event Date & Location
//                 Text(
//                   "${widget.event.date} • ${widget.event.location}",
//                   style: AppConstants.nunitoMediumW500.copyWith(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//
//                 const SizedBox(height: 6),
//
//                 // Event Organizer
//                 Text(
//                   "Organizer: ${widget.event.organizer}",
//                   style: AppConstants.nunitoMediumW500.copyWith(
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//
//                 const SizedBox(height: 6),
//
//                 // Event Description
//                 Text(
//                   widget.event.description,
//                   style: AppConstants.nunitoMediumW500.copyWith(
//                     fontSize: 14,
//                     color: Colors.grey[700],
//                   ),
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 // View More Button
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   decoration: BoxDecoration(
//                     color: AppTheme.primaryColor,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Center(
//                     child: Text(
//                       LocalStrings.viewMore,
//                       style: GoogleFonts.nunito(
//                         color: Colors.white,
//                         fontSize: AppConstants.mediumFontSize,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
// import 'package:ns_community_support_hub/core/local/app_constants.dart';
// import 'package:ns_community_support_hub/core/local/local_strings.dart';
// import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';
//
// import 'package:ns_community_support_hub/core/common_widgets/star_rating_bar_diasplay.dart';
//
// class HomeBusinessList extends StatelessWidget {
//   List<Business> displayList;
//   HomeBusinessList({super.key,required this.displayList});
//
//   @override
//   Widget build(BuildContext context) {
//
//     displayList.shuffle(Random());
//     var randomList = displayList.take(3).toList();
//
//
//     // Get screen width from MediaQuery
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     // Calculate the container width for equal distribution of items
//     double containerWidth = screenWidth * 0.28;
//     double containerHeight = containerWidth * 1.18;
//
//     // Dynamic image dimensions based on container size
//     // double imageWidth = containerWidth * 0.9;  // 90% of the container width
//     // double imageHeight = containerHeight * 0.6; // 60% of the container height
//
//     // Determine if the screen is small and adjust layout accordingly
//     bool isSmallScreen = screenWidth < 600; // Small screen threshold
//     if (isSmallScreen) {
//       containerWidth = screenWidth * 0.64; // Wider containers on small screens
//       //imageHeight = 150; // Smaller images for small screens
//       containerHeight = containerWidth * 1.2; // Adjust container height for smaller screens
//     }
//
//     return Container(
//       height: containerHeight,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: AppConstants.fullPagePaddingHorizontal,vertical: 4),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: List.generate(
//               randomList.length, // Show only 3 items in a row
//                   (index) => Padding(
//                 padding: const EdgeInsets.only(left: 12.0),
//                 child: BusinessListCard(business: randomList[index],),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class BusinessListCard extends StatelessWidget {
//   const BusinessListCard({super.key, required this.business});
//
//   final Business business;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     bool isSmallScreen = screenWidth < 600;
//
//     return Center(
//       child: FittedBox(
//         child: Container(
//           margin: const EdgeInsets.all(8.0),
//           width: /*!isSmallScreen ? 448 : 500*/448, // Fixed width
//           height: /*!isSmallScreen ? 448 : 550*/448, // Fixed height
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.white,
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black54,
//                 offset: Offset(8, 12),
//                 blurRadius: 24,
//                 spreadRadius: -8,
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.network(
//                       business.image,
//                       width: 400,
//                       height: 180,
//                       fit: BoxFit.fitWidth,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Image.asset(
//                           'assets/images/image_not_availible_img.png',
//                           width: 412,
//                           height: 180,
//                           fit: BoxFit.fitWidth,
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         business.name,
//                         style: AppConstants.nunitoMediumW500.copyWith(
//                             fontSize: isSmallScreen ? 14 : 16,
//                             fontWeight: FontWeight.bold
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     if (business.isVerified)
//                       Padding(
//                         padding: const EdgeInsets.only(left: 6),
//                         child: Image.asset(
//                           'assets/icons/verified_business_ic.png',
//                           width: 20,
//                           height: 20,
//                         ),
//                       ),
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                 StarRatingBar(rating: business.averageRating),
//                 const SizedBox(height: 6),
//                 Expanded(
//                   child: Text(
//                     business.description,
//                     maxLines: 5, // Set max lines limit
//                     overflow: TextOverflow.ellipsis,
//                     style: AppConstants.nunitoMediumW500.copyWith(
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   decoration: BoxDecoration(
//                     color: AppTheme.primaryColor,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Center(
//                     child: Text(
//                       LocalStrings.viewMore,
//                       style: GoogleFonts.nunito(
//                         color: Colors.white,
//                         fontSize: AppConstants.mediumFontSize,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
