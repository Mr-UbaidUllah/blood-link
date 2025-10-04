import 'package:blood_link/core/app_init.dart';
import 'package:blood_link/firebase_options.dart';
import 'package:blood_link/routes/export.dart';
import 'package:blood_link/routes/app_pages.dart';
import 'package:blood_link/viewmodel/on_boarding_controller.dart';
import 'package:blood_link/viewmodel/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BloodLink());
}

class BloodLink extends StatelessWidget {
  const BloodLink({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return AppInit(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Blood Link',
              theme: themeProvider.themeData,
              navigatorKey: NavigationHelper.navigatorKey,
              initialRoute: AppRoutes.splash,
              onGenerateRoute: (settings) {
                final route = AppPages.routes[settings.name];
                if (route != null) {
                  return MaterialPageRoute(
                    builder: route,
                    settings: settings,
                  );
                }
                return MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(child: Text("No route found")),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
