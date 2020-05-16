import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_assistant/Config.dart';

void main(){
  runApp(MaterialApp(
    home: TeacherInfo(),
  ));
}
class TeacherInfo extends StatefulWidget {
  @override
  _TeacherInfoState createState() => _TeacherInfoState();
}

class _TeacherInfoState extends State<TeacherInfo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Config.bgc,
        appBar: AppBar(
          backgroundColor: Config.appbar_color,
          title: Center(
            child: Text("Teacher's Info"),
          ),
        ),
        body: Container(

        )
    );
  }
}
