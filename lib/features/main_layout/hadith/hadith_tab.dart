import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/features/main_layout/hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {

     return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageAssets.hadithTabBg),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImageAssets.islamiLogo),
          //SizedBox(height: 40),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,//570
              enlargeCenterPage: true,
               enlargeFactor: 0.2,
                //autoPlay: true,
                viewportFraction: 0.8,
              ),
              items: List.generate(50,(index)=> index+1).map((index) {
                return HadithItem(index: index,);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
