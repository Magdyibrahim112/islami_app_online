import 'package:islami_app/core/resources/strings_manager.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences _prefs;
  static Future<void> init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveSuraIndex(String suraIndex) async {
    List<String> mostResentSuras =
        _prefs.getStringList(StringsManager.surasPrefsKey) ?? [];
    if (mostResentSuras.length > 7) {
      mostResentSuras.remove(mostResentSuras.first);
    }
    if (mostResentSuras.contains(suraIndex)) {
      mostResentSuras.remove(suraIndex);
    }
    mostResentSuras.add(suraIndex);
    await _prefs.setStringList(StringsManager.surasPrefsKey, mostResentSuras);
  }

  static Future<List<SuraModel>> getMostResentSuras() async {
    List<String> mostResentSurasIndex =
        _prefs.getStringList(StringsManager.surasPrefsKey) ?? [];
    List<SuraModel> mostResentSuras = [];
    //["1","2","3"];
    for (int i = 0; i < mostResentSurasIndex.length; i++) {
      int index = int.parse(mostResentSurasIndex[i]);
      SuraModel suraModel = SuraModel.suras[index - 1];
      mostResentSuras.add(suraModel);
    }
    return mostResentSuras.reversed.toList();
  }

  static Future<void> setOnboardingSeen() async {
    await _prefs.setBool(StringsManager.onboardingSeenKey, true);
  }

  static bool getOnboardingSeen() {
    return _prefs.getBool(StringsManager.onboardingSeenKey) ?? false;
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
