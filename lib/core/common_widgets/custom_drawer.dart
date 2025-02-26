import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';
import 'package:ns_community_support_hub/core/common_widgets/auth_provider.dart';
import 'package:ns_community_support_hub/core/local/local_strings.dart';
import 'package:ns_community_support_hub/core/app_theme/app_theme.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
            ),
            child: Center(
              child: Text(
                LocalStrings.websiteName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildDrawerItem(context, LocalStrings.home, WebRouteNames.home, currentRoute),
          _buildDrawerItem(context, LocalStrings.businessDirectory, WebRouteNames.businessDirectory, currentRoute),
          _buildDrawerItem(context, LocalStrings.events, WebRouteNames.events, currentRoute),
          _buildDrawerItem(context, LocalStrings.aboutUs, WebRouteNames.about, currentRoute),
          _buildDrawerItem(context, LocalStrings.faq, WebRouteNames.faqScreen, currentRoute),
          _buildDrawerItem(context, LocalStrings.contactUs, WebRouteNames.contactUs, currentRoute),
          const Spacer(),
          _buildLoginButton(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String text, String route, String currentRoute) {
    final bool isActive = currentRoute == route;
    return ListTile(
      leading: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: isActive ? AppTheme.primaryColor : Colors.black54,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? AppTheme.primaryColor : Colors.black87,
        ),
      ),
      onTap: () {
        if (!isActive) {
          Navigator.pop(context); // Close drawer before navigating
          context.go(route);
        }
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, value, child) {
        bool isLogIn = value.currentUser != null;
        return ListTile(
          leading: Icon(Icons.person_outline),
          title: Text(isLogIn ? LocalStrings.logOut : LocalStrings.logIn),
          onTap: () async {
            if (isLogIn) {
              context.go(WebRouteNames.profileDetails);
            } else {
              value.signInWithGoogle();
            }
          },
        );
      },
    );
  }
}
