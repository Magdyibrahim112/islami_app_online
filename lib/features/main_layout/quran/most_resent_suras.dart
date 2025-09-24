import 'package:flutter/material.dart';
import 'package:islami_app/core/extensions/context_extensions.dart';
import 'package:islami_app/core/resources/colors_manager.dart';
import 'package:islami_app/core/resources/prefs_manger/prefs-manager.dart';
import 'package:islami_app/models/sura_model.dart';

import 'most_resent_item.dart';

class MostResentSuras extends StatefulWidget {
  const MostResentSuras({super.key});

  @override
  State<MostResentSuras> createState() => MostResentSurasState();
}

class MostResentSurasState extends State<MostResentSuras> {
  List<SuraModel> mostResentSuras = [];

  void fetchMostResent() async {
    mostResentSuras = await PrefsManager.getMostResentSuras();
    //await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMostResent();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostResentSuras.isEmpty ? false : true,
      /// لو visible ب true هتظهر ال child لو ب false هتخفى ال child
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              itemBuilder: (context, index) =>
                  MostResentItem(sura: mostResentSuras[index],mostResentKey: widget.key as GlobalKey<MostResentSurasState>,),
              itemCount: mostResentSuras.length,
            ),
          ),
        ],
      ),
    );
  }
}
