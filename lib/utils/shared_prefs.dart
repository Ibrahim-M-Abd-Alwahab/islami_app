import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String mostRecentKey = 'most_recent';
}

// todo: save last sura => write date
void saveNewSuraList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // todo: get all sura list from shared pref ( if Null set it as empty list )
  List<String> mostRecentIndicesList =
      prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
  // todo: add sura index in sura list in shared pref
  // todo: duplicated
  if (mostRecentIndicesList.contains('$newSuraIndex')) {
    // todo: exist => remove
    mostRecentIndicesList.remove('$newSuraIndex');
    // todo: exist => insert
    // if i want to add element in the first of list insert()
    mostRecentIndicesList.insert(0, '$newSuraIndex');
    // if i want to add element in the last of list use add()
    // mostRecentIndicesList.add('$newSuraIndex');
  } else {
    // todo: exist => insert
    mostRecentIndicesList.insert(0, '$newSuraIndex');
    // if i want to add element in the last of list use add()
    // mostRecentIndicesList.add('$newSuraIndex');
  }
  if (mostRecentIndicesList.length > 5) {
    // mostRecentIndicesList.removeLast();
    mostRecentIndicesList = mostRecentIndicesList.sublist(0, 5); //update
  }

  await prefs.setStringList(
    SharedPrefsKeys.mostRecentKey,
    mostRecentIndicesList,
  );
}


