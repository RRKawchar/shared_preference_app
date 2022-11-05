import 'package:flutter/material.dart';
import 'package:shared_preference_app/shared_pre_demo1/views/demo1_home_screen.dart';
import 'package:shared_preference_app/shared_pre_demo2/views/demo2_home_screen.dart';
import 'package:shared_preference_app/todo_project/screens/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo app",
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      debugShowCheckedModeBanner: false,

      home: Demo2HomeScreen(),
    );
  }
}

