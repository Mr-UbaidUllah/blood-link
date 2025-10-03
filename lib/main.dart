import 'package:blood_link/theme/themes_provider.dart';
import 'package:blood_link/view/splash_screen.dart';
import 'package:blood_link/view_model/on_boarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
    ],
    child: const BloodLink(),
  ));
}

class BloodLink extends StatelessWidget {
  const BloodLink({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Link',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SplashScreen(),
    );
  }
}

