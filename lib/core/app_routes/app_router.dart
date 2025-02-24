import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/features/about_us/presentation/screens/about_us.dart';
import 'package:ns_community_support_hub/features/business_directory/models/business_model.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/business_add_screen.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/business_details_screen.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/business_directory_main_screen.dart';
import 'package:ns_community_support_hub/features/contact_us/presentation/screens/contact_us.dart';
import 'package:ns_community_support_hub/features/events/models/event_model.dart';
import 'package:ns_community_support_hub/features/events/presentation/add_event_screen.dart';
import 'package:ns_community_support_hub/features/events/presentation/event_details_screen.dart';
import 'package:ns_community_support_hub/features/events/presentation/events_screen.dart';
import 'package:ns_community_support_hub/features/faq_page/presentation/screens/faq_screen.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/home_screen.dart';
import 'package:ns_community_support_hub/features/my_profile/presentation/my_profile_details_screen.dart';
import 'package:ns_community_support_hub/features/pageNotFound404/presentation/page_not_found_screen.dart';
import 'package:ns_community_support_hub/features/privacy_policy/presentation/screens/privacy_policy.dart';
import 'package:ns_community_support_hub/features/terms/presentation/screens/terms_screen.dart';



final GoRouter appRouter = GoRouter(
  initialLocation: WebRouteNames.home,
  // routes: [
  //   ShellRoute(
  //     builder: (context, state, child) {
  //       return AppScaffold(child: child);
  //     },
  //     routes: [
  //       GoRoute(
  //         path: WebRouteNames.home,
  //         builder: (context, state) => HomeScreen(),
  //       ),
  //       GoRoute(
  //         path: WebRouteNames.businessDirectory,
  //         builder: (context, state) => BusinessDirectoryScreen(),
  //       ),
  //       GoRoute(
  //         path: WebRouteNames.events,
  //         builder: (context, state) => EventsScreen(),
  //       ),
  //       GoRoute(
  //         path: WebRouteNames.eventsDetails,
  //         builder: (context, state) => EventDetailsScreen(),
  //       ),
  //       GoRoute(
  //         path: WebRouteNames.profileDetails,
  //         builder: (context, state) => MyProfileDetailsScreen(title: 'title',),
  //       ),
  //     ],
  //
  //   ),
  // ],
  // routes: [
  //   GoRoute(
  //     path: WebRouteNames.home,
  //     builder: (context, state) => HomeScreen(),
  //   ),
  //   GoRoute(
  //     path: WebRouteNames.businessDirectory,
  //     builder: (context, state) => BusinessDirectoryScreen(),
  //   ),
  //   GoRoute(
  //     path: WebRouteNames.events,
  //     builder: (context, state) => EventsScreen(),
  //   ),
  //   GoRoute(
  //     path: WebRouteNames.eventsDetails,
  //     builder: (context, state) => EventDetailsScreen(),
  //   ),
  //   GoRoute(
  //     path: WebRouteNames.profileDetails,
  //     builder: (context, state) => MyProfileDetailsScreen(),
  //   ),
  //   GoRoute(
  //     path: WebRouteNames.addEvent,
  //     builder: (context, state) => AddEventScreen(),
  //   ),
  //   GoRoute(
  //     path: WebRouteNames.addBusiness,
  //     builder: (context, state) => AddBusinessScreen(),
  //   ),
  // ],

  routes: [
    GoRoute(
      path: WebRouteNames.home,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: WebRouteNames.businessDirectory,
      builder: (context, state) => BusinessDirectoryScreen(),
    ),
    GoRoute(
      path: WebRouteNames.events,
      builder: (context, state) => EventsScreen(),
    ),
    GoRoute(
        path: WebRouteNames.eventsDetails,
        builder: (context, state) {
          if (state.extra == null || state.extra is! EventsModel) {
            return PageNotFoundScreen();
          }
          EventsModel _eventData = state.extra as EventsModel;
          return EventDetailsScreen(event: _eventData);
        }
        //builder: (context, state) => EventDetailsScreen(),
        ),
    GoRoute(
      path: WebRouteNames.profileDetails,
      builder: (context, state) => MyProfileDetailsScreen(),
    ),
    GoRoute(
      path: WebRouteNames.addEvent,
      builder: (context, state) => AddEventScreen(),
    ),
    GoRoute(
      path: WebRouteNames.addBusiness,
      builder: (context, state) => AddBusinessScreen(),
    ),
    GoRoute(
      path: WebRouteNames.about,
      builder: (context, state) => AboutScreen(),
    ),
    GoRoute(
      path: WebRouteNames.contactUs,
      builder: (context, state) => ContactScreen(),
    ),
    GoRoute(
      path: WebRouteNames.businessDetails,
      builder: (context, state) {
        if (state.extra == null || state.extra is! Business) {
          return PageNotFoundScreen();
          }
        final businessData = state.extra as Business;
        return BusinessDetailScreen(business: businessData,);
      } ,
    ),
    GoRoute(
      path: WebRouteNames.faqScreen,
      builder: (context, state) => FAQScreen(),
    ),
    GoRoute(
      path: WebRouteNames.privacyPolicy,
      builder: (context, state) => PrivacyScreen(),
    ),
    GoRoute(
      path: WebRouteNames.termsNConditions,
      builder: (context, state) => TermsScreen(),
    ),
    GoRoute(
      path: WebRouteNames.pageNotFound,
      builder: (context, state) => PageNotFoundScreen(),
    ),
  ],

  errorBuilder: (context, state) => PageNotFoundScreen(),

);
