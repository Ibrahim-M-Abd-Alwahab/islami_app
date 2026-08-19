// todo: save last sura => write date
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String mostRecentKey = 'most_recent';
}

void saveNewSuraList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // todo: get all sura list from shared pref
  List<String> mostRecentIndicesList =
      prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
  // todo: add sura index in sura list in shared pref
  mostRecentIndicesList.add('$newSuraIndex');
  await prefs.setStringList(
    SharedPrefsKeys.mostRecentKey,
    mostRecentIndicesList,
  );
}

// todo: get suras list => read date
Future<List<int>> getSuraMostRecentSuraList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // todo: ['0','1'] => todo: [0,1]
  // todo: List<String> => List<int> ==> by using map()
  List<String> mostRecentIndicesAsString =
      prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
  List<int> mostRecentIndicesAsInt =
      mostRecentIndicesAsString.map((element) => int.parse(element)).toList();
  return mostRecentIndicesAsInt;
}
