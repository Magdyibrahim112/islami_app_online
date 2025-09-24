import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/resources/constant_manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_resent_suras.dart';
import 'package:islami_app/core/resources/prefs_manger/prefs-manager.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.sura, required this.mostResentKey});

  final SuraModel sura;
  final GlobalKey<MostResentSurasState> mostResentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //MostResent.addMostResent(sura);
        PrefsManager.saveSuraIndex(sura.suraIndex);
        Navigator.pushNamed(context, RoutesManager.suraDetails, arguments: SuraDetailsArguments(sura: sura, mostResentKey: mostResentKey));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImageAssets.suraNumberBg),
                Text(
                  sura.suraIndex,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24),
            Column(
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
                Text(
                  sura.versesNumber,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              sura.suraNameAr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.white,
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}
class SuraDetailsArguments{
  SuraModel sura;
  GlobalKey<MostResentSurasState> mostResentKey;
  SuraDetailsArguments({required this.sura, required this.mostResentKey});
}