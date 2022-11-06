enum Gender{FEMALE,MALE,OTHER}

enum ProgrammingLanguage{DART,JAVASCRIPT,KOTLIN,SWIFT}

class Settings{
  final String? userName;
  final Gender? gender;
  final Set<ProgrammingLanguage>? programmingLanguage;
  final bool? isEmployed;


  Settings({this.userName,this.gender,this.programmingLanguage,this.isEmployed});

}