import 'package:flutter/foundation.dart';

class RoutineItem{
  String cname,ccode,tname,time,room;
  RoutineItem(String cname,String ccode,String tname,String time,String room){
    this.cname = cname;
    this.ccode = ccode;
    this.tname = tname;
    this.time = time;
    this.room = room;
  }
}