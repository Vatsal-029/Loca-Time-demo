import 'package:flutter/material.dart';
import 'morning.dart';
import 'evening.dart';
import 'night.dart';



void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LocaTime(),
));

class LocaTimer extends StatelessWidget {
  static const String _title = 'Loca Time';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: LocaTime(),
    );
  }
}

class LocaTime extends StatefulWidget {
  @override
  _LocaTimeState createState() => _LocaTimeState();
}

class _LocaTimeState extends State<LocaTime> {
  Morning newMorning = Morning();
  Evening newEvening = Evening();
  Night newNight = Night();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Morning(),
      ),
    );
  }
}