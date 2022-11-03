import 'package:flutter/material.dart';
import 'package:shared_preference_app/practice1/practice1_screen.dart';
import 'package:shared_preference_app/todo_app/views/home_page.dart';

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

      home: HomePage(),
    );
  }
}

