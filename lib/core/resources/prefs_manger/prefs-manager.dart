import 'package:islami_app/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static Future<void> saveSuraIndex(String suraIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostResentSuras =
        prefs.getStringList("most_resent_suras") ?? [];
    if(mostResentSuras.length > 7 ){
      mostResentSuras.remove(mostResentSuras.first );
    }
    if(mostResentSuras.contains(suraIndex)){
      mostResentSuras.remove(suraIndex);
    }
    mostResentSuras.add(suraIndex);
    prefs.setStringList("most_resent_suras", mostResentSuras);
  }

  static Future<List<SuraModel>> getMostResentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostResentSurasIndex =
        prefs.getStringList("most_resent_suras") ?? [];
    List<SuraModel> mostResentSuras = [];
    //["1","2","3"];
    for (int i = 0; i < mostResentSurasIndex.length; i++) {
      int index = int.parse(mostResentSurasIndex[i]);
      SuraModel suraModel = SuraModel.suras[index-1];
      mostResentSuras.add(suraModel);
    }
    return mostResentSuras.reversed.toList();
  }

  /*
  static List<SuraModel> mostResentSuras = [];
  static void addMostResent(SuraModel suraModel) {
    mostResentSuras.add(suraModel);
    //print(mostResentSuras.length);
    /// how to cash list -> Presistent storage..
  }
  static List<SuraModel> getMostResentSuras(){
    return mostResentSuras;
    /// read data from Presistent storage..
  }
   */
}
