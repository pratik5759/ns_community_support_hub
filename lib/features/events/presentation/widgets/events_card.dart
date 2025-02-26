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

// class EventsCard extends StatelessWidget {
//   final String eventName;
//   final String description;
//   final double? containerWidth;
//   final double? containerHeight;
//   final double? imageHeight;
//   final double? imageWidth;
//
//   EventsCard({
//     super.key,
//     required this.eventName,
//     required this.description,
//     this.containerWidth,
//     this.containerHeight,
//     this.imageHeight,
//     this.imageWidth,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     // Adaptive default sizing
//     double defaultContainerWidth = screenWidth * 0.28;
//     double defaultContainerHeight = defaultContainerWidth * 1.06;
//     double defaultImageHeight = defaultContainerHeight * 0.5;
//     double defaultImageWidth = defaultContainerWidth;
//
//     // Adjust layout for small screens
//     bool isSmallScreen = screenWidth < 600;
//     if (isSmallScreen) {
//       defaultContainerWidth = screenWidth * 0.45;
//       defaultImageHeight = 150;
//       defaultContainerHeight = defaultContainerWidth * 1.2;
//     }
//
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       width: containerWidth ?? defaultContainerWidth,
//       height: containerHeight ?? defaultContainerHeight,
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
//           children: [
//             Center(
//               child: Container(
//                 width: imageWidth ?? defaultImageWidth,
//                 height: imageHeight ?? defaultImageHeight,
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
//               eventName,
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: 16,
//               ),
//             ),
//             Text(
//               description,
//               style: AppConstants.nunitoMediumW500.copyWith(
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 6),
//             Container(
//               width: (containerWidth ?? defaultContainerWidth) * 0.28,
//               decoration: BoxDecoration(
//                 color: AppTheme.primaryColor,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Center(
//                 child: InkWell(
//                   onTap: () {
//                     context.go(WebRouteNames.eventsDetails);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Text(
//                       LocalStrings.viewMore,
//                       style: GoogleFonts.nunito(
//                         color: Colors.white,
//                         fontSize: AppConstants.mediumFontSize,
//                       ),
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

class EventsCard extends StatelessWidget {
  final EventsModel event;
  final double? containerWidth;
  final double? containerHeight;
  final double? imageHeight;
  final double? imageWidth;

  const EventsCard({
    super.key,
    required this.event,
    this.containerWidth,
    this.containerHeight,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adaptive default sizing
    double defaultContainerWidth = screenWidth * 0.28;
    double defaultContainerHeight = defaultContainerWidth * 1.3;
    double defaultImageHeight = defaultContainerHeight * 0.5;
    double defaultImageWidth = defaultContainerWidth;

    // Adjust layout for small screens
    bool isSmallScreen = screenWidth < 600;
    if (isSmallScreen) {
      defaultContainerWidth = screenWidth * 0.45;
      defaultImageHeight = 150;
      defaultContainerHeight = defaultContainerWidth * 1.2;
    }



    return MediaQuery.removePadding(
      context: context,
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: containerWidth ?? defaultContainerWidth,
        height: containerHeight ?? defaultContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: const Offset(8, 12),
              blurRadius: 24,
              spreadRadius: -8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: event.imageUrl != null && event.imageUrl!.isNotEmpty
                      ? Image.network(
                          event.imageUrl!,
                          width: imageWidth ?? defaultImageWidth,
                          height: imageHeight ?? defaultImageHeight,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/image_not_available_img.png',
                            // Replace with your asset image path
                            width: imageWidth ?? defaultImageWidth,
                            height: imageHeight ?? defaultImageHeight,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          'assets/images/image_not_available_img.png',
                          // Replace with your asset image path
                          width: imageWidth ?? defaultImageWidth,
                          height: imageHeight ?? defaultImageHeight,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: Image.network(
              //     event.imageUrl,
              //     width: imageWidth ?? defaultImageWidth,
              //     height: imageHeight ?? defaultImageHeight,
              //     fit: BoxFit.cover,
              //     errorBuilder: (context, error, stackTrace) => Icon(
              //       Icons.broken_image,
              //       size: defaultImageWidth * 0.6,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),

              Text(
                event.name,
                style: AppConstants.nunitoMediumW500.copyWith(fontSize: 16),
              ),
              Text(
                event.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppConstants.nunitoMediumW500.copyWith(fontSize: 16),
              ),
              // DELETE BUTTON (Appears on top-right corner)

              const SizedBox(height: 6),
              Container(
                width: (containerWidth ?? defaultContainerWidth) * 0.28,
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
                      padding: const EdgeInsets.all(4.0),
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
    );
  }
}

// Confirm Delete Dialog
// void _confirmDelete(BuildContext context, String eventId) {
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text("Delete Event"),
//       content: Text("Are you sure you want to delete this event?"),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text("Cancel"),
//         ),
//         TextButton(
//           onPressed: () {
//             context.read<EventProvider>().deleteEvent(eventId);
//             Navigator.pop(context);
//           },
//           child: Text("Delete", style: TextStyle(color: Colors.red)),
//         ),
//       ],
//     ),
//   );
// }
