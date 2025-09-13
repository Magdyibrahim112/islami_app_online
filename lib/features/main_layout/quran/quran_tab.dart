import 'package:flutter/material.dart';
import 'package:islami_app/core/extensions/context_extensions.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/main_layout/quran/most_resent_item.dart';
import 'package:islami_app/features/main_layout/quran/sura_item.dart';
import 'package:islami_app/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filterdSuras = SuraModel.suras;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageAssets.quranTabBg),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(ImageAssets.islamiLogo),
            ),
            SizedBox(height: 4), //16//21
            TextField(
              onChanged: (input) {
                filterSurasListBySearshKey(input);
              },
              cursorColor: ColorsManager.ofWhite,
              style: TextStyle(
                fontSize: 18,
                color: ColorsManager.ofWhite,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorsManager.gold, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorsManager.gold, width: 1),
                ),
                prefixIcon: ImageIcon(
                  AssetImage(IconAssets.quran),
                  color: ColorsManager.gold,
                ),
                labelText: "Sura name",
                labelStyle: TextStyle(
                  color: ColorsManager.ofWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Most Recently",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorsManager.ofWhite,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: context.getHeight * 0.17, //0.17
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MostResentItem(),
                itemCount: 10,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Suras List",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorsManager.ofWhite,
              ),
            ),
            SizedBox(height: 10),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: ColorsManager.white,
              ),
              itemBuilder: (context, index) =>
                  SuraItem(sura: filterdSuras[index]),
              itemCount: filterdSuras.length,
            ),
          ],
        ),
      ),
    );
  }

  void filterSurasListBySearshKey(String searchKey) {
    filterdSuras = SuraModel.suras
        .where(
          (sura) =>
              sura.suraNameEn.toLowerCase().contains(searchKey.toLowerCase()) ||
              sura.suraNameAr.contains(searchKey),
        )
        .toList();
    setState(() {});
  }
}
