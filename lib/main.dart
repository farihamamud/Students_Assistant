import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:students_assistant/Notice.dart';
import 'package:students_assistant/login.dart';
import 'Config.dart';


void main(){
  runApp(MaterialApp(
    home: Start(),
  ));
}
class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  Future<void> waitStart() async {
    await Future.delayed(Duration(seconds: 3));
    try{
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      String uid = user.uid;
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) =>  Notice()
          )
      );
    }
    catch(e){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) =>  Login()
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    waitStart();
    return Scaffold(
      backgroundColor: Config.bgc,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://pngimage.net/wp-content/uploads/2018/06/icon-student-png-1.png",
                width: 150.0,
              ),
              SizedBox(height: 50,),
              Text(
                "Students Assistant",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
