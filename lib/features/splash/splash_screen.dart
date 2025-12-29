import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/resources/prefs_manger/prefs-manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(Duration(seconds: 2), () {
      if (PrefsManager.getOnboardingSeen()) {
        Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
      } else {
        Navigator.pushNamed(context, RoutesManager.onBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              Spacer(flex: 4),
              Image.asset(ImageAssets.splashLogo),
              Spacer(flex: 6),
              Image.asset(ImageAssets.brandingImage),
            ],
          ),
        ),
      ),
    );
  }
}
