import 'package:flutter/material.dart';
import 'package:shared_preference_app/todo_app/model/todo_model.dart';
import 'package:shared_preference_app/todo_app/views/components/build_body.dart';
import 'package:shared_preference_app/todo_app/views/components/new_item_view.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Todo> list=[
    Todo(title: "Item A"),
    Todo(title: "Item B"),
    Todo(title: "Item C"),
    Todo(title: "Item D"),
  ];

  @override
  void initState() {
    list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:const Text("Flutter Todo"),
        centerTitle: true,
      ),
      body:buildBody(),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.add),
        onPressed: ()=>goToNewItemView(),
      ),
    );

  }

  Widget buildBody() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index){
        return buildItem(list[index]);
      },
    );
  }

  Widget buildItem(Todo todo) {
    return Dismissible(
      key: Key(todo.hashCode.toString()),
      onDismissed: (direction)=>removeItem(todo),
      direction: DismissDirection.endToStart,
      background: Container(
        padding:const EdgeInsets.only(right: 10),
        color: Colors.red[600],
        alignment: Alignment.centerRight,
        child:const Icon(Icons.delete,color: Colors.white,),
      ),
      child:buildListTile(todo)
    );
  }

  Widget buildListTile(Todo todo){
    return ListTile(
      title: Text(todo.title),
      trailing: Checkbox(
        value: todo.complete,
        onChanged: null,
      ),
      onTap: ()=>setCompleteness(todo),
      onLongPress:()=>goToEditItemView(todo),
    );
  }

  void removeItem(Todo todo){
    list.remove(todo);
  }

  void setCompleteness(Todo item){
    setState(() {
      item.complete=!item.complete;
    });

  }

  void goToNewItemView(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return const NewItemView();
        })
    ).then((title){

      addTodb(Todo(title: title));
    });
  }

  void goToEditItemView(Todo todo){
    Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return NewItemView();
        })
    ).then((title){

      addTodb(Todo(title: title));
    });
  }

  void addTodb(Todo item){
  list.add(item);
  }
}




