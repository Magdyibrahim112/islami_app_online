import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';

class MostResentItem extends StatelessWidget {
  const MostResentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Al_Fatha", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black,
              ),),
              Text("الفاتحه", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black,
              ),),
              Text("7 Verses", style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black,
              ),),

            ],
          ),
          Image.asset(ImageAssets.mostRecentCardImage)
        ],
      ),
    );
  }
}
