import 'package:shared_preference_app/global/global.dart';
import 'package:shared_preference_app/shared_pre_demo2/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  Future saveSettings(Settings settings) async {
    pref = await SharedPreferences.getInstance();

    await pref!.setString("username", settings.userName!);
    await pref!.setBool("isEmployed", settings.isEmployed!);
    await pref!.setInt("gender", settings.gender!.index);
    await pref!.setStringList('programmingLanguage',
        settings.programmingLanguage!.map((e) => e.index.toString()).toList());


    print("Save setting");
  }

  Future<Settings> getSettings()async{

    pref=await SharedPreferences.getInstance();

    final username=pref!.getString("username");
    final isEmployed=pref!.getBool('isEmployed');
    final gender=Gender.values[pref!.getInt('gender')??0];

    final programmingLanguagesIndicies=pref!.getStringList('programmingLanguage');
    final programmingLanguages=programmingLanguagesIndicies!.map((stringIndex) =>
    ProgrammingLanguage.values[int.parse(stringIndex)]).toSet();

    return Settings(
      userName: username,
      gender: gender,
      isEmployed: isEmployed,
      programmingLanguage: programmingLanguages,
    );
  }
}
