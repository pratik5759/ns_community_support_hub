import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ns_community_support_hub/core/app_routes/route_names.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon or image for 404
            Icon(
              Icons.error_outline,
              size: 100.0,
              color: Colors.grey,
            ),
            SizedBox(height: 20.0),
            // Text showing 404
            Text(
              '404',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            // Text explaining the error
            Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 20.0),
            // Button to redirect to homepage
            ElevatedButton(
              onPressed: () {
                // Navigate to the homepage or desired location
                // Example using Navigator.pushReplacementNamed:
               context.go(WebRouteNames.home);
              },
              child: Text('Go to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}


