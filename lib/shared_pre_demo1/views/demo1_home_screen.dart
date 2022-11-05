import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preference_app/global/global.dart';
import 'package:shared_preference_app/shared_pre_demo1/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Demo1HomeScreen extends StatefulWidget {
  const Demo1HomeScreen({Key? key}) : super(key: key);

  @override
  State<Demo1HomeScreen> createState() => _Demo1HomeScreenState();
}

class _Demo1HomeScreenState extends State<Demo1HomeScreen> {


  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();

  @override
  void initState() {
    initialGetSaveData();
    super.initState();
  }

  void initialGetSaveData()async{
    pref=await SharedPreferences.getInstance();

    Map<String,dynamic> jsonDetails=jsonDecode(pref!.getString('userData')!);

    User user=User.fromJson(jsonDetails);

    if(jsonDetails.isNotEmpty){

      nameController.value=TextEditingValue(text: user.name!);
      emailController.value=TextEditingValue(text: user.email!);
      phoneController.value=TextEditingValue(text: user.phone!);
    }
  }

  void storeData(){

    User users=User(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text
    );

    String userData=jsonEncode(users);

    print(userData);
    pref!.setString('userData', userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     height: 50,
                     child: TextField(
                       controller: nameController,
                       decoration:const InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: "Enter name"
                       ),
                     ),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child: TextField(
                        controller: emailController,
                        decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter email"
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      child:TextField(
                        controller: phoneController,
                        decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter phone"
                        ),
                      ),
                    ),
                  ),

                  ElevatedButton(onPressed: (){

                    print(nameController.text);
                    print(emailController.text);
                    print(phoneController.text);

                    storeData();

                  }, child:const Text("Save the form")),
                  ElevatedButton(onPressed: (){
                    pref!.remove('userData');
                    nameController.value=const TextEditingValue(text: "");
                    emailController.value=const TextEditingValue(text: "");
                    phoneController.value=const TextEditingValue(text: "");

                  }, child:const Text("Submit and clear form")),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
