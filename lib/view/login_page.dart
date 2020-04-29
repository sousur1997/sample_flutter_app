import 'package:demo_web/model/person_login.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget{
  LoginState createState() => LoginState();   
}

class LoginState extends State<LoginWidget>{
  int tf_id = 0;
  var fieldList;
  LoginPerson person;
  final nameTextController = TextEditingController(); 
  final passTextController = TextEditingController();
  final repPassTextController = TextEditingController();

  final inAnimation = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0));
  final outAnimation = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0));
  
  Widget getNameField() {
      return TextField(
        controller: nameTextController,
        autofocus: false,
        cursorColor: Colors.black,
        style: TextStyle(
          fontFamily: 'IndieFlower', 
          color: Color(0xff071927), 
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        
        decoration: InputDecoration(
          hintText: "Enter your name.",
          fillColor: Color(0xffffce78),
          contentPadding: EdgeInsets.only(
            left: 20
          ),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50.0))
          )
        ),
      );
  }
  
  Widget getPassField() {
      return TextField(
        controller: passTextController,
        autofocus: false,
        cursorColor: Colors.black,
        style: TextStyle(
          fontFamily: 'IndieFlower', 
          color: Color(0xff071927), 
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Enter a password.",
          fillColor: Color(0xffffce78),
          contentPadding: EdgeInsets.only(
            left: 20
          ),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50.0))
          )
        ),
      );
  }

  Widget getRepPassField() {
      return TextField(
        controller: repPassTextController,
        autofocus: false,
        cursorColor: Colors.black,
        style: TextStyle(
          fontFamily: 'IndieFlower', 
          color: Color(0xff071927), 
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
      
        decoration: InputDecoration(
          hintText: "Enter your password again.",
          fillColor: Color(0xffffce78),
          contentPadding: EdgeInsets.only(
            left: 20
          ),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50.0))
          )
        ),
      );
  }

  Widget getTextField(int id){
    return fieldList[id];
  }

  @override
  initState(){
    person = new LoginPerson();
    fieldList = new List(3);
    fieldList[0] = getNameField();
    fieldList[1] = getPassField();
    //fieldList[2] = getRepPassField();
  }

  void next_state(){
    if(tf_id == 0){
      person.setName(nameTextController.text);
    }else if(tf_id == 1){
      person.setPass(passTextController.text);
    }
    if(tf_id == 0){
      tf_id = 1;
    }
    if(tf_id == 0){
      nameTextController.text = person.getName();
    }else if(tf_id == 1){
      passTextController.text = person.getPass();
    }
  }

  void prev_state(){
    if(tf_id == 0){
      person.setName(nameTextController.text);
    }else if(tf_id == 1){
      person.setPass(passTextController.text);
    }
    if(tf_id == 1){
      tf_id = 0;
    }
    if(tf_id == 0){
      nameTextController.text = person.getName();
    }else if(tf_id == 1){
      passTextController.text = person.getPass();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.scaleDown)
              ),
              
              child: Container(
                color: Color(0x44000000),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              )
            ),
            Positioned(
                bottom: 0.0,
                //alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/fox_base.png",
                  height: MediaQuery.of(context).size.height*0.49,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                )
            ),
            Positioned(
                left: MediaQuery.of(context).size.width/4,
                top: MediaQuery.of(context).size.height/3.5,
                //alignment: Alignment(-0.4,-0.25),
                child: Image.asset("assets/images/standing_fox.png",
                  height: MediaQuery.of(context).size.height*0.28,
                  width: MediaQuery.of(context).size.width*0.33,
                  fit: BoxFit.scaleDown,
                )
            ),
            Positioned(
              left: 0.0,
              width: MediaQuery.of(context).size.width,
              bottom: MediaQuery.of(context).size.height/15,
              child: Column(
                children: <Widget>[
                  Text(
                    "Welcome !",
                    style: TextStyle(
                      fontFamily: 'IndieFlower', 
                      color: Colors.white, 
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "Sign in to access your accont",
                    style: TextStyle(
                      fontFamily: 'IndieFlower', 
                      color: Colors.white, 
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation,);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: MediaQuery.of(context).size.height /18,
                      child: getTextField(tf_id),
                      key: ValueKey<int>(tf_id),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Text(
                    "Want to create an account?",
                    style: TextStyle(
                      fontFamily: 'IndieFlower', 
                      color: Colors.white, 
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                  MaterialButton(
                    height: MediaQuery.of(context).size.height/12,
                    minWidth: MediaQuery.of(context).size.width*0.4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                    child: 
                    Text("Register",
                      style: TextStyle(
                        fontFamily: 'IndieFlower', 
                        color: Colors.white, 
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              child: 
                MaterialButton(
                  height: MediaQuery.of(context).size.height/12,
                  minWidth: MediaQuery.of(context).size.width*0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0)
                    ),
                  ),
                  child: 
                  Text("Back",
                    style: TextStyle(
                      fontFamily: 'IndieFlower', 
                      color: Colors.white, 
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    setState(() {
                      prev_state();
                    });
                  },
                )
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: 
                MaterialButton(
                  height: MediaQuery.of(context).size.height/12,
                  minWidth: MediaQuery.of(context).size.width*0.4,
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0)
                    ),
                  ),
                  child:
                  Text("Next",
                    style: TextStyle(
                      fontFamily: 'IndieFlower', 
                      color: Color(0xff071927), 
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      next_state();
                    });
                  },
                )
            ),
          ],
        ),
      )
    );
  }
}