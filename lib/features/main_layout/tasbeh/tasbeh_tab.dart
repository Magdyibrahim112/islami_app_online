import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  final List<String> tasbeh = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  double angle = 0;
  int counter = 1;
  int tasbehIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(ImageAssets.islamiLogo),
            const SizedBox(height: 24),
            const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const Row(),
                  Image.asset(ImageAssets.sebhaHead, width: width * 0.4),
                  Positioned.fill(
                    top: MediaQuery.sizeOf(context).height * .096,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap:_onTasbehClicked,
                          child: Transform.rotate(
                            angle: angle,
                            child: Image.asset(
                              ImageAssets.sebhaBody,
                              width: width,
                            ),
                          ),),
                        Column(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tasbeh[tasbehIndex],
                              style: TextStyle(
                                color: ColorsManager.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Row(),
                            Text(
                              counter.toString(),
                              style: TextStyle(
                                color: ColorsManager.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
  void _onTasbehClicked() {
    angle += 16;
    counter++;
    if (counter == 33) {
      counter = 1;
      tasbehIndex++;
      if (tasbehIndex == tasbeh.length) {
        tasbehIndex = 0;
      }
    }
    setState(() {});
  }
}
