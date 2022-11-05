class Todo1{


  int? id;
  String? title;
  String? description;
  bool? status;

  Todo1({this.id,this.title,this.description,this.status}){

    id=id;
    title=title;
    description=description;
    status=status;
  }

  formJson(jsonData){

    return Todo1(
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        status: jsonData['status']
    );
  }

  toJson(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'status':status
    };
  }
}