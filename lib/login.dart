import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:students_assistant/Config.dart';
import 'package:students_assistant/Notice.dart';
import 'package:toast/toast.dart';
void main(){
  runApp(MaterialApp(
    home: Login()
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String pw,email;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void login(String email,String pw) async {
    print(email+pw);
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: pw);
      FirebaseUser user = result.user;
      String uid = user.uid;
      print(uid);
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) =>  Notice()
      ));
    }
    catch(e){
      print(e);
      Toast.show(e.message, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.bgc,
      appBar: AppBar(
        backgroundColor: Config.appbar_color,
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Config.app_name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: "Enter Email",
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              onChanged: (value){
                pw = value;
              },
              decoration: InputDecoration(
                hintText: "Enter Password",
              ),
              obscureText: true,
            ),
            SizedBox(height: 40,),
            RaisedButton(
              onPressed: (){
                login(email, pw);
                //print(email+" "+pw);
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
