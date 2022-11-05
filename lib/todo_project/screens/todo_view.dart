import 'package:flutter/material.dart';
import 'package:shared_preference_app/todo_project/constants/app_colors.dart';
import 'package:shared_preference_app/todo_project/model/todo.dart';

class TodosViews extends StatefulWidget {
   TodosViews({Key? key,required this.todo}) : super(key: key);
  Todo1 todo;

  @override
  State<TodosViews> createState() => _TodosViewsState();
}

class _TodosViewsState extends State<TodosViews> {

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  @override
  void initState() {
    if(widget.todo !=null){
      titleController.text=widget.todo.title!;
      descriptionController.text=widget.todo.description!;
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        backgroundColor: appColor,
        title:const Text("Todo View"),
        centerTitle: true,
        elevation: 10,

      ),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: colorOverride(


                  TextField(
                      controller: titleController,
                      onChanged: (data){
                        widget.todo.title=data;
                      },
                      style:const TextStyle(
                        color:Colors.white,),
                      decoration: InputDecoration(
                          labelText: "title",
                          labelStyle:const TextStyle(
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:const BorderSide(
                                  color: Colors.white
                              )
                          )
                      )
                  ),
                )
              ),
              const SizedBox(height: 25),
              Container(
                  child: colorOverride(TextField(
                    maxLines: 5,
                    onChanged: (data) {
                      widget.todo.description = data;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelStyle:const TextStyle(color: Colors.white),
                      labelText: "Description",
                      fillColor: Colors.white,
                      border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      //fillColor: Colors.green
                    ),
                    controller: descriptionController,
                  ))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: appColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  buildShowDialog();
                },
                  child: Text(
                    "${widget.todo.status! ? 'Mark as Not Done' : 'Mark as Done'} ",
                    style:const TextStyle(color: Colors.white),
                  )
              ),
             const VerticalDivider(
                color: Colors.white,
              ),
              IconButton(
                icon:const Icon(Icons.save, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context, widget.todo);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  buildShowDialog(){
    return showDialog(context: context, builder: (context)=>AlertDialog(
      title:const Text("Alert"),
      content: Text("Mark this todo as ${widget.todo.status!? 'not done':'done'}"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child:const Text("No")),

        TextButton(onPressed: (){
          setState(() {

            widget.todo.status=!widget.todo.status!;
          });
          Navigator.pop(context);
        }, child:const Text("Yes")),
      ],

    ));
  }

  Widget colorOverride(Widget child){

    return Theme(
        data: ThemeData(
          accentColor: Colors.white,
          primaryColor: Colors.white,
          hintColor: Colors.white,
        ),
        child: child
    );
  }
}
