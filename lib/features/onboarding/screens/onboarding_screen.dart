import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/features/onboarding/widgets/on_boarding_indicator_widget.dart';
import 'package:islami_app/features/onboarding/widgets/on_boarding_item.dart';
import 'package:islami_app/models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(ImageAssets.islamiLogo),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: OnboardingModel.onboardingPages.length,
                  onPageChanged: (index) {
                    currentPageIndex = index;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return OnBoardingItem(
                      model: OnboardingModel.onboardingPages[index],
                    );
                  },
                ),
              ),
              OnBoardingIndicatorWidget(
                pageController: pageController,
                currentPageIndex: currentPageIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
