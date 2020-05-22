import 'package:flutter/material.dart';
import 'package:students_assistant/CRInfo.dart';
import 'package:students_assistant/Routine.dart';
import 'package:students_assistant/StudentPanel.dart';
import 'package:students_assistant/TeacherInfo.dart';

import 'Config.dart';


void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  String sem;
  Home({String sem = "1st"}){
    this.sem = sem;
  }
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.bgc,
      appBar: AppBar(
        title: Text(widget.sem+" Semester"),
        backgroundColor: Colors.blue,
      ),
      body: Container(

        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                child: Text("Routine",
                    style:
                    TextStyle(
                      color: Colors.white,
                      fontSize:18,
                    )
                ),
                onPressed: (){

                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => Routine(sem: widget.sem,)
                      )
                  );

                },
              ),
              SizedBox(height: 15,),
              RaisedButton(
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                child: Text("Teacher Info",
                    style:
                    TextStyle(
                      color: Colors.white,
                      fontSize:18,
                    )
                ),
                onPressed: (){

                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => TeacherInfo(sem: widget.sem,)
                      )
                  );

                },
              ),
              SizedBox(height: 15,),
              RaisedButton(
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                child: Text("CR Info",
                    style:
                    TextStyle(
                      color: Colors.white,
                      fontSize:18,
                    )
                ),
                onPressed: (){

                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => CRInfo(sem: widget.sem,)
                      )
                  );

                },
              ),
              SizedBox(height: 15,),

              RaisedButton(
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                child: Text("Student Panel",
                    style:
                    TextStyle(
                      color: Colors.white,
                      fontSize:18,
                    )
                ),
                onPressed: (){

                  Navigator.push(context,
                      MaterialPageRoute(
                         builder: (context) => StudentPanel()
                      )
                  );

                },
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),

    );
  }
}
