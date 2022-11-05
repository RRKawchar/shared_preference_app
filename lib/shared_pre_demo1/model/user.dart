class User{


  String? name;
  String? email;
  String? phone;

  User({this.name,this.email,this.phone});

  User.fromJson(Map<String,dynamic> json):
      name=json['name'],
      email=json['email'],
     phone=json['phone'];


  Map<String,dynamic> toJson()=>{

    'name':name,
    'email':email,
     'phone':phone


  };
}