import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:students_assistant/Class/NoticeItem.dart';
import 'package:students_assistant/Config.dart';
import 'package:students_assistant/Home.dart';
import 'package:students_assistant/login.dart';

void main(){
  runApp(MaterialApp(
    home: Notice(),
  ));
}
class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  DatabaseReference dr = FirebaseDatabase.instance.reference().child("MainNotice");
  List<NoticeItem> items = new List();

  void startActivity(String sem) {
    Navigator.of(context).pop();
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Home(sem: sem)
        )
    );
  }

  @override
  void initState() {
    super.initState();
    dr.onValue.listen((event) {
      print(event);
      print(event.snapshot);
      Map <dynamic,dynamic> mp = event.snapshot.value;
      print(mp);
      items.clear();
      for(var key in mp.keys){
        Map <dynamic,dynamic> smp = mp[key];
        try{
          items.add(new NoticeItem(title: smp["title"].toString(),date: smp["date"].toString(),details:smp["details"].toString()));
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
          child: Text("Notice"),
        ),
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(15),
            color: Colors.blue,
            child: Text("Logout",
                style:
                TextStyle(
                  color: Colors.white,
                  fontSize:15,
                )
            ),
            onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (context) => Login()
                    )
                );
            },
          ),
          SizedBox(height: 15,),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,i){
            return Card(
              child: ListTile(
                title: Text(items[i].title),
                subtitle: Text(items[i].details + "\n"+items[i].date),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://www.pngitem.com/pimgs/m/44-441041_notice-and-announcement-announcement-icon-png-free-transparent.png"),
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(

        child: ListView(

          children: <Widget>[
            DrawerHeader(
              child:
              Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Image.network(
                    "https://pngimage.net/wp-content/uploads/2018/06/icon-student-png-1.png",
                    width: 120.0,
                  ),
                  SizedBox(height: 5,),
                ],
              ),

            ),
            ListTile(
              title: Text("1st Semester"),
              onTap: (){
                startActivity("1st");
              },
            ),
            ListTile(
              title: Text("2nd Semester"),
              onTap: (){
                startActivity("2nd");
              },
            ),
            ListTile(
              title: Text("3rd Semester"),
              onTap: (){
                startActivity("3rd");
              },
            ),
            ListTile(
              title: Text("4th Semester"),
              onTap: (){
                startActivity("4th");
              },
            ),
            ListTile(
              title: Text("5th Semester"),
              onTap: (){
                startActivity("5th");
              },
            ),
            ListTile(
              title: Text("6th Semester"),
              onTap: (){
                startActivity("6th");
              },
            ),
            ListTile(
              title: Text("7th Semester"),
              onTap: (){
                startActivity("7th");
              },
            ),
            ListTile(
              title: Text("8th Semester"),
              onTap: (){
                startActivity("8th");
              },
            ),
            ListTile(
              title: Text("9th Semester"),
              onTap: (){
                startActivity("9th");
              },
            ),
            ListTile(
              title: Text("10th Semester"),
              onTap: (){
                startActivity("10th");
              },
            ),
            ListTile(
              title: Text("11th Semester"),
              onTap: (){
                startActivity("11th");
              },
            ),
            ListTile(
              title: Text("12th Semester"),
              onTap: (){
                startActivity("12th");
              },
            ),
          ],
        ),
      ),
    );
  }
}
