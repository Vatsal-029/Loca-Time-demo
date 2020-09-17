import 'dart:async';
import 'evening.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class Morning extends StatefulWidget {
  @override
  _MorningState createState() => _MorningState();
}

class _MorningState extends State<Morning> {
  _currentDate(){
    var date = DateTime.now();
    return '${DateFormat('EEEE - d MMM, yyyy').format(date)}';
}
  double seconds;
  _currentTime(){
    return '${DateFormat('jm').format(DateTime.now())}';
  }
  _triggerUpdate() {
    Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) => setState(
              () {
            seconds = DateTime.now().second / 60;
          },
        ));
  }
  @override
  void initState() {
    super.initState();
    seconds = DateTime.now().second / 60;
    _triggerUpdate();
  }

  int _bottomIndex = 0;
  void _onTapped(int index){
    setState(() {
      _bottomIndex = index;
    });
  }
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,),
      drawer: Drawer(child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader( decoration: BoxDecoration(
            color: Colors.amber),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(text: TextSpan(
                text:'Die with ', style: TextStyle(
                fontFamily: 'Montserrat-Medium', fontSize: 20,
              ),
              children:[
                TextSpan(text:'MEMORIES, ', style: TextStyle(
                fontFamily: 'Montserrat-Medium', fontSize: 30,),),
                TextSpan(text:'not Dreams', style: TextStyle(
                  fontFamily: 'Montserrat-Medium', fontSize: 20,),),],
              ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.alarm),
            title: Text('All Alarms')),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Timer'),),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Global Time'),),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),),
          ListTile(
            title: Text('All Alarms'),),
          Text('Version 1.0.1', style: TextStyle(fontStyle: FontStyle.italic),)
        ],
      ),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/sunrise.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
              child: Text('Good Morning Vatsal,',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kufam-Regular',
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 40),
            Padding(
                padding: const EdgeInsets.fromLTRB(20,0,50,0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Some Text ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat-Medium',
                          fontSize: 18,
                          fontStyle: FontStyle.italic,),),
                    ),
                ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,50,0),
              child: RaisedButton(
                onPressed: (){},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_location,
                        color: Colors.green,
                      ),
                      SizedBox(width: 10,),
                      Text('Select your Location',
                        style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat-Medium',
                        fontSize: 15,))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Container(
                  width: 289,
                  height: 260,
                  color: Colors.transparent,
                  child: Stack(children: [
                    Center(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          //color: hexToColor('#2c3143'),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        width: 340,
                        height: 340,
                        child: Center(
                          child: Text(_currentTime(),
                            style: GoogleFonts.bungee(
                              fontSize: 45.0,
                              fontWeight: FontWeight.normal,
                              textStyle: TextStyle(color: Colors.white),),)
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,60,0,0),
                        child: Text( _currentDate(),
                          style: GoogleFonts.bungee(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            textStyle: TextStyle(color: Colors.white),),),
                      ),
                    ),
                    Center(
                      child: CircularPercentIndicator(
                        radius: 250.0,
                        lineWidth: 6.0,
                        animation: false,
                        percent: seconds,
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: hexToColor('#2c3143'),
                        progressColor: hexToColor('#58CBF4'),
                      ),
                    )
                  ],),
                ),
              )
            ],),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 280, 0),
              child: FlatButton(
                color: Colors.white,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Evening()));
                  },
                  child: Icon(Icons.arrow_forward, color: Colors.black,)),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=> showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate:
        new DateTime.now().subtract(new Duration(days: 33330)),
        lastDate: new DateTime.now().add(new Duration(days: 33330)),
      ),
        backgroundColor: Colors.orange,
        child: Icon(Icons.calendar_today, color: Colors.white,),

      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.amber.shade700,
        ),
        child: BottomNavigationBar(
          currentIndex: _bottomIndex,
          onTap: _onTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white,),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm, color: Colors.white,),
              title: Text('Alarm'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.border_color, color: Colors.white,),
              title: Text('Notes'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Colors.white,),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
