import 'package:flutter/material.dart';
import 'package:students_assistant/Config.dart';

void main(){
  runApp(MaterialApp(
    home: CRInfo(),
  ));
}
class CRInfo extends StatefulWidget {

  @override
  _CRInfoState createState() => _CRInfoState();
}
class _CRInfoState extends State<CRInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Config.bgc,
        appBar: AppBar(
          backgroundColor: Config.appbar_color,
          title: Center(
            child: Text("CR's Info"),
          ),
        ),
        body: Container(

        )
    );
  }
}
