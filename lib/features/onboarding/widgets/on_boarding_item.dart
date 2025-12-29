import 'package:flutter/material.dart';
import 'package:islami_app/models/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Expanded(child: Image.asset(model.image)),
        Text(model.title, style: Theme.of(context).textTheme.headlineMedium),
        model.body == null
            ? SizedBox.shrink()
            : Text(
                model.body!,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
        const SizedBox(height: 36),
      ],
    );
  }
}
