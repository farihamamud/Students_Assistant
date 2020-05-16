import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_assistant/Config.dart';


void main(){
  runApp(MaterialApp(
    home: StudentPanel(),
  ));
}
class StudentPanel extends StatefulWidget {
  @override
  _StudentPanelState createState() => _StudentPanelState();
}

class _StudentPanelState extends State<StudentPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Config.appbar_color,
          title: Center(
            child: Text("Student Panel"),
          ),
        ),

    );
  }
}
