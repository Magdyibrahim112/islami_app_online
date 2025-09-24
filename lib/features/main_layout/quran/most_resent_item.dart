import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/resources/prefs_manger/prefs-manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_resent_suras.dart';
import 'package:islami_app/features/main_layout/quran/sura_item.dart';
import 'package:islami_app/models/sura_model.dart';

class MostResentItem extends StatelessWidget {
   MostResentItem({super.key, required this.sura, required this.mostResentKey});
  SuraModel sura;
  GlobalKey<MostResentSurasState> mostResentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PrefsManager.saveSuraIndex(sura.suraIndex);
        Navigator.pushNamed(context, RoutesManager.suraDetails, arguments: SuraDetailsArguments(sura: sura, mostResentKey: mostResentKey));
      },
      child: Container(
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
                Text(sura.suraNameEn, style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),),
                Text(sura.suraNameAr, style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),),
                Text("${sura.versesNumber} Verses", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),),
      
              ],
            ),
            Image.asset(ImageAssets.mostRecentCardImage)
          ],
        ),
      ),
    );
  }
}
