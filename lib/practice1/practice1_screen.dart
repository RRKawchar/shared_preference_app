import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Practice1Screen extends StatefulWidget{
  @override
  _Practice1ScreenState createState() => _Practice1ScreenState();
}

class _Practice1ScreenState extends State<Practice1Screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
            padding: const EdgeInsets.only(top:80, left:20, right:20),
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [

                ElevatedButton(
                    onPressed: () async {
                      SharedPreferences pre = await SharedPreferences.getInstance();
                      pre.setString("name", "Riyazur Rohman"); //save string
                      pre.setInt("age", 23); //save integer
                      pre.setBool("UnMarried", false); //save boolean
                      pre.setDouble("price", 240.50); //save double
                      pre.setStringList("tags", ["Flutter", "Dart", "App"]); //save List
                    },
                    child: const Text("Save Data")
                ),


                ElevatedButton(
                    onPressed: () async {
                      SharedPreferences pre = await SharedPreferences.getInstance();
                      String name = pre.getString("name") ?? "";
                      //here "??" is a fallback operator,
                      //if the return is null, it will be the assigned value;

                      int age = pre.getInt("age") ?? 0;
                      bool married = pre.getBool("married") ?? false;
                      double price = pre.getDouble("price") ?? 0.00;
                      List<String> tags = pre.getStringList("tags") ?? [];

                      print("Name:$name");
                      print("Age:$age");
                      print("Married:$married");
                      print("Tags:$tags");

                    },
                    child: const Text("Get Data")
                )
              ],)
        )
    );
  }
}