import 'package:blood_link/routes/export.dart';

class AppPages {
  static final routes = {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.onboarding: (context) => const OnBoardingScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.signIn: (context) => const SignInScreen(),
    AppRoutes.signUp: (context) => const SignUpScreen(),
  };
}
