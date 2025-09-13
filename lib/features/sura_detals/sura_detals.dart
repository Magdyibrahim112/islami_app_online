import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manager.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/features/sura_detals/verse_item.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraDetals extends StatefulWidget {
  const SuraDetals({super.key});

  @override
  State<SuraDetals> createState() => _SuraDetalsState();
}

class _SuraDetalsState extends State<SuraDetals> {
  late SuraModel suraArguments;
  List<String> verses = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    suraArguments = ModalRoute.of(context)?.settings.arguments as SuraModel;
    loadSuraContent(suraArguments.suraIndex);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(suraArguments.suraNameEn)),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImageAssets.suraDetalsPatternLeft),
                  Image.asset(ImageAssets.suraDetalsPatternRight),
                ],
              ),
              Text(
                suraArguments.suraNameAr,
                style: TextStyle(
                  color: ColorsManager.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          Expanded(
            child:verses.isEmpty ? Center(child: CircularProgressIndicator(color: ColorsManager.gold,),)
                : ListView.builder(
              itemBuilder: (context, index) => VerseItem(verse: verses[index]),itemCount: verses.length,)
          ),
        ],
      ),
    );
  }

  void loadSuraContent(String suraIndex) async {
    String filePath = "assets/files/suras/$suraIndex.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> surasLines = fileContent.trim().split("\n");///trim can remove white spases
    for(int i = 0 ; i < surasLines.length ; i++){
      surasLines[i]+= "[${i+1}]";
    }
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      verses = surasLines;
    });
    //suraContent = surasLines.join();/// هرجعها تانى كا string
    //setState(() {});
    //await Future.delayed(Duration(seconds: 1));
    //suraContent = fileContent;
    //setState(() {});
  }
}
/*
Text(
              "Sura Content",
              style: TextStyle(
                color: ColorsManager.gold,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            */