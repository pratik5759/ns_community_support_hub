import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/common_widgets/custom_app_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/footer_bar.dart';
import 'package:ns_community_support_hub/core/common_widgets/hero_section_with_page_name.dart';
import 'package:ns_community_support_hub/core/local/app_constants.dart';
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
      appBar: CustomAppBar(scaffoldKey: AppConstants.scaffoldKey,),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Hero Section with page name
            HeroSectionWithPageName(pageName: LocalStrings.eventDetails),

            /// event detailed card
            EventDetailsWidget(event: EventsModel(id: 'id',
                name: 'name',
                description: 'Event Details Please come and join us to celebrate Navratri - Dandiya/Garba Nights 2024. Please bring your family and friends and Let\'s Play some Dandiya and Garba. Navratri is being celebrated as one of major festival in INDIA. Navratri is a festival dedicated to the worship of the Hindu deity Durga. Sharad Navaratri: This is the most important of the Navaratri\'s. It is simply called Maha Navaratri (the Great Navaratri) and is celebrated in the ‘pratipada\' (first day) of the bright fortnight of the lunar month of Ashvin. Also known as Sharad Navaratri, as it is celebrated during Sharad (beginning of winter, September-October). Here people will be dancing in circle on traditional Folk songs and also they play with sticks called DANDIYA Please come and join us for this Dancing Event. Here are the Dates and Timing Details for all 6 Days: 4 Oct-Friday [8pm-until close] 5 Oct Saturday [8pm until close] 6 Oct-Sunday [8pm-until close] 11 Oct-Friday [Bpm until close] 12 Oct-Saturday [8pm- until close] 13.0ct Sunday [8pm-until close] Single day ticket-\$10 Event Pass (Valid for all 6 days) - \$45 Student Event Pass (Valid for all 6 days) - \$30 Seniors [Above 65] & Kids (Below 8] will get FREE Entry. For sponsorship inquiries & Packages please email us at ifcns.canada@gmail.com Event pass holders will need Govt issued Photo ID while taking entry. Event passes are not transferable to any other person Kids Below 8 years of age & Seniors above 65 years of age can take free entry. To verify the age, gatekeeper may ask for ID. We reserve right to escort or to refuse admission anyone off the event for improper conduct. Duplicate bookings/tickets will be discarded automatically. You need to enter all the first and last names for all passes you are booking. We reserve rights about any future changes without prior notice All tickets are non-refundable and non-transferable. Food is not allowed in the premises. Only reusable water bottles will be allowed inside premises.',
                date: 'date',
                location: 'location',
                imageUrl: 'https://static.vecteezy.com/system/resources/previews/009/171/100/non_2x/demo-symbol-concept-words-demo-on-wooden-blocks-photo.jpg',
                organizer: 'organizer'),),
            
            /// Footer Bar (Appears after all tiles)
            FooterBar(),
          ],
        ),
      ),
    );
  }
}
