import 'package:flutter/material.dart';

import '../model/model.dart';

class Demo2HomeScreen extends StatefulWidget {
  const Demo2HomeScreen({Key? key}) : super(key: key);

  @override
  State<Demo2HomeScreen> createState() => _Demo2HomeScreenState();
}

class _Demo2HomeScreenState extends State<Demo2HomeScreen> {

  final nameController=TextEditingController();
  var _selectedGender=Gender.FEMALE;
  var _selectedProgramingLanguage=<ProgrammingLanguage>{};

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
              decoration: InputDecoration(
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
            title: Text("Dart"),
              value: _selectedProgramingLanguage.contains(ProgrammingLanguage.DART),
              onChanged: (newChange){
              setState(() {

              });
              }
          ),
          CheckboxListTile(
              title: Text("JavaScript"),
              value: _selectedProgramingLanguage.contains(ProgrammingLanguage.DART),
              onChanged: (newChange){
                setState(() {

                });
              }
          ),
          CheckboxListTile(
              title: Text("Kotline"),
              value: _selectedProgramingLanguage.contains(ProgrammingLanguage.DART),
              onChanged: (newChange){
                setState(() {

                });
              }
          ),
          CheckboxListTile(
              title: Text("Swift"),
              value: _selectedProgramingLanguage.contains(ProgrammingLanguage.DART),
              onChanged: (newChange){
                setState(() {
                 _selectedProgramingLanguage=newChange as Set<ProgrammingLanguage>;
                });
              }
          ),
        ],
      ),
    );
  }
}
