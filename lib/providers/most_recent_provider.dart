import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_prefs.dart';

class MostRecentProvider extends ChangeNotifier {
  // todo: data
  List<int> mostRecentList = [];
  // todo: data
  // todo: get suras list => read date
  void getSuraMostRecentSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // todo: ['0','1'] => todo: [0,1]
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    // todo: List<String> => List<int> ==> by using map()
    mostRecentList =
        mostRecentIndicesAsString.map((element) => int.parse(element)).toList();
    // todo: mostRecentIndicesAsInt.reversed.toList() or i can use insert method instead of add

    notifyListeners();
  }
}
