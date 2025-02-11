import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/app_scaffold.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/features/business_directory/presentation/business_directory.dart';
import 'package:ns_community_support_hub/features/events/presentation/events_screen.dart';
import 'package:ns_community_support_hub/features/home_screen/presentation/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: WebRouteNames.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: WebRouteNames.home,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: WebRouteNames.businessDirectory,
          builder: (context, state) => BusinessDirectoryScreen(),
        ),GoRoute(
          path: WebRouteNames.events,
          builder: (context, state) => EventsScreen(),
        ),
      ],
    ),
  ],
);
