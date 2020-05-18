import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:students_assistant/Class/RoutineItem.dart';

import 'Config.dart';


void main() => runApp(MaterialApp(
  home: Routine(),
));

class Routine extends StatefulWidget {
  String sem;
  Routine({String sem = "1st"}){
    this.sem = sem;
  }
  @override
  _RoutineState createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {

  DatabaseReference dr = FirebaseDatabase.instance.reference().child("Routine");

  // Main map sec => day => class
  Map<String,Map<String,List<RoutineItem>>> root = new Map();

  //For Dropdown section
  Map sec = new Map();
  List<String> sectionlist = List();
  String dropdownValue = 'Section A';
  String sem = "";

  String current_section = "SA";

  void change(String n){
    String last = n.substring(n.length-1,n.length);
    print(last);
    setState(() {
      current_section="S"+last; //Changing current section
    });
  }

  Widget getDay(String dayIndex) {
    try {
      //Checking null
      print(root[current_section][dayIndex][0].cname);
    } catch(e) {
      return Text("No Class Today");
    }

    return ListView.builder(
      itemCount: root[current_section][dayIndex].length,
      itemBuilder: (context,i){
        return Card(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex:61,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text(root[current_section][dayIndex][i].ccode,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(height: 10,),
                      Text(root[current_section][dayIndex][i].cname),
                      SizedBox(height: 10,),
                      Text("Teacher's Name: "+root[current_section][dayIndex][i].tname),

                    ],
                  ),
                ),
                Expanded(
                  flex:39,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(root[current_section][dayIndex][i].time,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),),
                      SizedBox(height: 20,),
                      Text("Room No: "+root[current_section][dayIndex][i].room),
                      SizedBox(height: 20,),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    sem =  widget.sem;
    dr.child(sem).once().then((DataSnapshot data){
      sec = data.value;

      print("Loaded");
      // Main map
      for(var section in sec.keys){ //Loop Section
        root[section] = new Map();
        for(var day in sec[section].keys){ //Loop Day
          root[section][day] = new List();
          // print(section+" "+day);
          for(var cls in sec[section][day].keys){
            print(cls+ " > ");
            Map<dynamic,dynamic> item = sec[section][day][cls];

//              print(
//                  item["cname"].toString()+
//                      item["ccode"].toString()+
//                      item["tname"].toString()+
//                      item["time"].toString()+
//                      item["room"].toString()
//              );

            root[section][day].add(new RoutineItem(
                item["cname"].toString(),
                item["ccode"].toString(),
                item["tname"].toString(),
                item["time"].toString(),
                item["room"].toString()
            ));

          }
        }
      }

      // Dropdown section
      for(int i=0;i<sec.length;i++){
        sectionlist.add("Section "+String.fromCharCode(i+65));
      }
      setState(() {
        print("End");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(content);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Config.bgc,
        appBar: AppBar(
          title: Text("Routine"),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              iconSize: 24,
              iconEnabledColor: Colors.white,
              elevation: 16,
              style: TextStyle(
                  color: Colors.black
              ),
              underline: Container(
                height: 1,
                color: Colors.white,
              ),
              onChanged: (String newValue) {
                dropdownValue = newValue;
                change(newValue);
              },
              selectedItemBuilder: (context){
                return sectionlist
                    .map((String value) {
                  return Row(
                    children: <Widget>[
                      Text(
                        value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                }).toList();
              },
              items: sectionlist
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(width: 15,),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(child: Text("Sunday"),),
              Tab(child: Text("Monday"),),
              Tab(child: Text("Tuesday"),),
              Tab(child: Text("Wednesday"),),
              Tab(child: Text("Thursday"),),
            ],
          ),
        ),

        body: TabBarView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: getDay("d1"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: getDay("d2"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: getDay("d3"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: getDay("d4"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: getDay("d5"),
            ),

          ],
        ),
      ),
    );
  }
}
