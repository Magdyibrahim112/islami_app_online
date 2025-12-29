import 'package:islami_app/core/resources/assets_manager.dart';

class OnboardingModel {
  final String title;
  final String? body;
  final String image;
  const OnboardingModel({
    required this.image,
    this.body, // nul => عشان مش فى كل الحالات موجود
    required this.title,
  });
  static const List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      title: "Welcome To Islami App",
      image: ImageAssets.onBoarding1,
    ),
    OnboardingModel(
      title: "Welcome To Islami",
      body: "We Are Very Excited To Have You In Our Community",
      image: ImageAssets.onBoarding2,
    ),
    OnboardingModel(
      title: "Reading the Quran",
      body: "Read, and your Lord is the Most Generous",
      image: ImageAssets.onBoarding3,
    ),
    OnboardingModel(
      title: "Bearish",
      body: "Praise the name of your Lord, the Most High",
      image: ImageAssets.onBoarding4,
    ),
    OnboardingModel(
      title: "Holy Quran Radio",
      body:
          "You can listen to the Holy Quran Radio through the application for free and easily",
      image: ImageAssets.onBoarding5,
    ),
  ];
}
