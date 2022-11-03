import 'package:flutter/material.dart';

class NewItemView extends StatefulWidget {
  const NewItemView({super.key,  });

  // final String title;

  @override
  State<NewItemView> createState() => _NewItemViewState();
}

class _NewItemViewState extends State<NewItemView> {


  TextEditingController textController=TextEditingController();
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextField(
              controller: textController,
            ),
            TextButton(
              onPressed: () {
                save();
              },
              child:const Text("Save"),
            )
          ],
        ),
      ),
    );
  }

  void save() {
    if(textController.text.isNotEmpty) {
      Navigator.of(context).pop(textController.text);
    }
  }
}
