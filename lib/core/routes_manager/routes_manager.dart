import 'package:flutter/cupertino.dart';
import 'package:islami_app/features/main_layout/main_layout.dart';
import 'package:islami_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:islami_app/features/splash/splash_screen.dart';
import 'package:islami_app/features/sura_detals/sura_detals.dart';

class RoutesManager{
  static const String splash = "/splash";
  static const String onBoarding = "/onBoarding";
  static const String mainLayout = "/mainLayout";
  static const String suraDetails = "/suraDetails";
  static Map<String, WidgetBuilder> routes = {
    splash : (context)=> SplashScreen(),
    mainLayout : (context)=> MainLayout(),
    suraDetails : (context)=> SuraDetals(),
    onBoarding : (context)=> OnboardingScreen()
  };
}