// import 'package:flutter/material.dart';
// import 'package:shared_preference_app/todo_app/model/todo_model.dart';
//
// class BuildBody extends StatefulWidget {
//   const BuildBody({Key? key}) : super(key: key);
//
//   @override
//   State<BuildBody> createState() => _BuildBodyState();
// }
//
// class _BuildBodyState extends State<BuildBody> {
//
//   List<Todo> list=[
//     Todo(title: "Item A"),
//     Todo(title: "Item B"),
//     Todo(title: "Item C"),
//     Todo(title: "Item D"),
//   ];
//
//   @override
//   void initState() {
//     list;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: list.length,
//       itemBuilder: (context,index){
//         return buildItem(list[index]);
//       },
//     );
//   }
//
//   Widget buildItem(Todo todo) {
//     return Dismissible(
//       key: Key(todo.hashCode.toString()),
//       onDismissed: (direction)=>removeItem(todo),
//       direction: DismissDirection.endToStart,
//       background: Container(
//         padding:const EdgeInsets.only(right: 10),
//         color: Colors.red[600],
//         alignment: Alignment.centerRight,
//         child:const Icon(Icons.delete,color: Colors.white,),
//       ),
//       child: ListTile(
//           title: Text(todo.title),
//           trailing: Checkbox(
//             value: todo.complete,
//             onChanged: null,
//           ),
//           onTap: ()=>setCompleteness(todo)
//       ),
//     );
//   }
//
//   void removeItem(Todo todo){
//     list.remove(todo);
//   }
//
//   void setCompleteness(Todo item){
//     setState(() {
//       item.complete=!item.complete;
//     });
//
//   }
// }
