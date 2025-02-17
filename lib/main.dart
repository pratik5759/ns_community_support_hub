import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ns_community_support_hub/core/app_routes/app_router.dart';
import 'package:ns_community_support_hub/core/common_widgets/auth_provider.dart';
import 'package:ns_community_support_hub/features/my_profile/my_screen_provider.dart';
import 'package:ns_community_support_hub/firebase_options.dart';
import 'package:provider/provider.dart';
Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyScreenProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()..loadUser()), // Load user on start
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: HomeScreen(),
    );
  }
}

