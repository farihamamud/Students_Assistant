import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students_assistant/Class/TeacherItem.dart';
import 'package:students_assistant/Config.dart';

void main(){
  runApp(MaterialApp(
    home: TeacherInfo(),
  ));
}
class TeacherInfo extends StatefulWidget {
  String sem;
  TeacherInfo({String sem = "1st"}){
    this.sem = sem;
  }
  @override
  _TeacherInfoState createState() => _TeacherInfoState();
}

class _TeacherInfoState extends State<TeacherInfo> {

  DatabaseReference dr = FirebaseDatabase.instance.reference().child("TName");
  List<TeacherItem> items = new List();
  void initState() {
    super.initState();
    dr.child(widget.sem).onValue.listen((event) {
      print(event);
      print(event.snapshot);
      Map <dynamic,dynamic> mp = event.snapshot.value;
      print(mp);
      items.clear();
      for(var key in mp.keys){
        Map <dynamic,dynamic> smp = mp[key];
        try{
          items.add(new TeacherItem(smp["name"].toString(),smp["deg"].toString(),smp["email"].toString(),smp["phone"].toString()));
        }
        catch(e){
        }
      }
      setState(() {
      });
    });
  }
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
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,i){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name : " + items[i].name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Designation : " + items[i].deg,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Email : " + items[i].email,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Mobile No : " + items[i].phone,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}
