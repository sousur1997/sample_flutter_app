class LoginPerson{
  String name;
  String pass;

  LoginPerson(){
    name = "";
    pass = "";
  }

  void setName(String name){
    this.name = name;
  }

  void setPass(String pass){
    this.pass = pass;
  }

  String getName(){
    return name;
  } 

  String getPass(){
    return pass;
  }
}