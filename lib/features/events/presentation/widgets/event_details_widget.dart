import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';

/*class EventDetailsWidget extends StatelessWidget {

  String eventImgLink;
  String eventName;

  EventDetailsWidget({super.key,required this.eventImgLink,required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(eventName),
                ],
              ),
            ),

            Image.network(eventImgLink,height: 100,width: 100,)
          ],
        ),
      ),
    );
  }
}*/




class EventDetailsWidget extends StatelessWidget {
  final EventsModel event;

  const EventDetailsWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define breakpoints
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    // Adjust image size based on screen width and height
    double imageWidth = screenWidth * (isMobile ? 0.8 : isTablet ? 0.4 : 0.3);
    double imageHeight = screenHeight * (isMobile ? 0.35 : isTablet ? 0.4 : 0.45);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Event image at the top for mobile view
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              event.imageUrl,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: imageWidth * 0.6,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Event details below image for mobile view
          _buildEventDetails(),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event details on the left for tablet and web
          Expanded(child: _buildEventDetails()),
          const SizedBox(width: 16),
          // Event image on the right for larger screens
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              event.imageUrl,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: imageWidth * 0.6,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          event.name,
          style: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.bold),
          softWrap: true,
        ),
        const SizedBox(height: 8),
        Text(
          "👤 Organized by: ${event.organizer}",
          style: GoogleFonts.nunito(fontSize: 14, color: Colors.grey[700]),
          softWrap: true,
        ),
        const SizedBox(height: 8),
        Text(
          "📅 Date: ${event.date}",
          style: GoogleFonts.nunito(fontSize: 14, color: Colors.grey[700]),
          softWrap: true,
        ),
        const SizedBox(height: 8),
        Text(
          "📍 Location: ${event.location}",
          style: GoogleFonts.nunito(fontSize: 14, color: Colors.grey[700]),
          softWrap: true,
        ),
        const SizedBox(height: 8),
        Text(
          event.description,
          style: GoogleFonts.nunito(fontSize: 16),
          softWrap: true,
        ),
      ],
    );
  }
}



