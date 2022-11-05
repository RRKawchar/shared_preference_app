import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preference_app/todo_project/constants/app_colors.dart';
import 'package:shared_preference_app/todo_project/global/global.dart';
import 'package:shared_preference_app/todo_project/model/todo.dart';
import 'package:shared_preference_app/todo_project/screens/todo_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todos = [];

  setupTodo()async{

    pref=await SharedPreferences.getInstance();

    String? stringTodo=pref!.getString('todo');

    List todoList=jsonDecode(stringTodo!);
    for(var todo in todoList){

      setState(() {
        
        todos.add(Todo1().formJson(todo));
      });
    }

  }

  saveTodo(){

    List items=todos.map((e) => e.toJson()).toList();

    pref!.setString('todo', jsonEncode(items));
  }

  @override
  void initState() {
    setupTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        title: const Text(
          "Todo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromRGBO(64, 75, 96, .9),
              elevation: 8,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: InkWell(
                onTap: ()async {
                  Todo1 t=await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodosViews(todo: todos[index]),
                    ),
                  );
                  if(t !=null){
                    setState(() {
                    todos[index]=t;
                    });
                    saveTodo();
                  }
                },
                child: makeListTile(todos[index], index),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black12,
        child:const Icon(Icons.add,color: Colors.white,),
        onPressed: (){
          addToDo();
        },
      ),
    );
  }

  addToDo()async{
    int id=Random().nextInt(30);
    Todo1 t=Todo1(id: id, title: '', description: '', status: false);
    Todo1 returnTodo=await Navigator.push(context, MaterialPageRoute(builder: (context)=>TodosViews(todo: t)));
    if(returnTodo !=null){

      setState(() {
        todos.add(returnTodo);
      });
      saveTodo();
    }

  }
  makeListTile(Todo1 todo, index) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(64, 75, 96, .9),
              border: Border(
                  right: BorderSide(
                width: 1.0,
                color: Colors.white24,
              ))),
          child: CircleAvatar(
            backgroundColor: Colors.black26,
            child: Text("${index + 1}"),
          ),
        ),
        title: Row(
          children: [
            Text(
              todo.title!,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            todo.status!
                ? const Icon(
                    Icons.verified,
                    color: Colors.greenAccent,
                  )
                : Container()
          ],
        ),
        subtitle: Wrap(
          children: [
            Text(todo.description!,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: const TextStyle(color: Colors.white))
          ],
        ),
        trailing: InkWell(
            onTap: () {
              delete(todo);
            },
            child: const Icon(Icons.delete, color: Colors.white, size: 30.0)));
  }

  delete(Todo1 todo) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Alert"),
              content: const Text("You are sure to delete!"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("No")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todos.remove(todo);
                      });
                      Navigator.pop(context);
                      saveTodo();
                    },
                    child: const Text("Yes"))
              ],
            ));
  }

}
