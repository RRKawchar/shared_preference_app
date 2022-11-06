import 'package:flutter/material.dart';
import 'package:shared_preference_app/global/global.dart';
import 'package:shared_preference_app/shared_pre_demo2/preferences/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';

class Demo2HomeScreen extends StatefulWidget {
  const Demo2HomeScreen({Key? key}) : super(key: key);

  @override
  State<Demo2HomeScreen> createState() => _Demo2HomeScreenState();
}

class _Demo2HomeScreenState extends State<Demo2HomeScreen> {

  final preferencesServices=PreferencesServices();

  final nameController=TextEditingController();
  var _selectedGender=Gender.FEMALE;
  var _selectedProgramingLanguage=<ProgrammingLanguage>{};
  bool _isEmployed=false;


    void _populateFields()async{
      final settings=await preferencesServices.getSettings();
      setState(() {
        nameController.text=settings.userName!;
        _selectedGender=settings.gender!;
        _selectedProgramingLanguage=settings.programmingLanguage!;
        _isEmployed=settings.isEmployed!;
      });
    }

  showData()async{
    pref=await SharedPreferences.getInstance();

    String? name =pref!.getString('username');
   bool? isemployed= pref!.getBool('isEmployed');
   int? gen= pref!.getInt('gender');
   List<String>? proLanguag= pref!.getStringList('programmingLanguage');

   print(name);

   print(isemployed);
   print(gen);
   print(proLanguag);

  }

  @override
  void initState() {
  _populateFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("User Settings"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(

              controller: nameController,
              decoration:const InputDecoration(
                labelText: "User Name"
              ),
            ),
          ),
          RadioListTile(
            title:const Text("Female"),
              value: Gender.FEMALE,
              groupValue: _selectedGender,
              onChanged: (newValue){

              setState(() {
                _selectedGender=newValue!;
              });
              }
          ),
          RadioListTile(
              title:const Text("Male"),
              value: Gender.MALE,
              groupValue: _selectedGender,
              onChanged: (newValue){

                setState(() {
                  _selectedGender=newValue!;
                });
              }
          ),
          RadioListTile(
              title:const Text("Other"),
              value: Gender.OTHER,
              groupValue: _selectedGender,
              onChanged: (newValue){

                setState(() {
                  _selectedGender=newValue!;
                });
              }
          ),

          CheckboxListTile(
            title:const Text("Dart"),
              value: _selectedProgramingLanguage.contains(ProgrammingLanguage.DART),
              onChanged: (newChange){
              setState(() {
              _selectedProgramingLanguage.contains(ProgrammingLanguage.DART)?
              _selectedProgramingLanguage.remove(ProgrammingLanguage.DART):
              _selectedProgramingLanguage.add(ProgrammingLanguage.DART);
              });
              }
          ),
          CheckboxListTile(
              title:const Text("JavaScript"),
              value: _selectedProgramingLanguage.contains(ProgrammingLanguage.JAVASCRIPT),
              onChanged: (newChange){
                setState(() {
                  _selectedProgramingLanguage.contains(ProgrammingLanguage.JAVASCRIPT)?
                  _selectedProgramingLanguage.remove(ProgrammingLanguage.JAVASCRIPT):
                  _selectedProgramingLanguage.add(ProgrammingLanguage.JAVASCRIPT);
                });
              }
          ),
          CheckboxListTile(
              title:const Text("Kotlin"),
              value: _selectedProgramingLanguage.contains(ProgrammingLanguage.KOTLIN),
              onChanged: (newChange){
                setState(() {
                  _selectedProgramingLanguage.contains(ProgrammingLanguage.KOTLIN)?
                  _selectedProgramingLanguage.remove(ProgrammingLanguage.KOTLIN):
                  _selectedProgramingLanguage.add(ProgrammingLanguage.KOTLIN);
                });
              }
          ),
          CheckboxListTile(
              title:const Text("Swift"),
              value: _selectedProgramingLanguage.contains(ProgrammingLanguage.SWIFT),
              onChanged: (newChange){
                setState(() {
                  _selectedProgramingLanguage.contains(ProgrammingLanguage.SWIFT)?
                  _selectedProgramingLanguage.remove(ProgrammingLanguage.SWIFT):
                  _selectedProgramingLanguage.add(ProgrammingLanguage.SWIFT);
                });
              }
          ),
          
          SwitchListTile(
              title:const Text("Is Employed"),
              value: _isEmployed, onChanged: (newValue){
                setState(() {
                  _isEmployed=newValue;
                });

          }),

          TextButton(onPressed: _saveSettings, child:const Text("Save settings")),
        ],
      ),
    );
  }

  void _saveSettings(){
    final newSettings=Settings(
      userName: nameController.text,
      gender: _selectedGender,
      programmingLanguage: _selectedProgramingLanguage,
      isEmployed: _isEmployed
    );

    print(newSettings);
    preferencesServices.saveSettings(newSettings);
  }
}
