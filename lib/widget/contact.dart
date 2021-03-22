import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/bookingtype/grouproom.dart';
import 'package:sleepy_hotel_zoo/bookingtype/info.dart';
import 'package:sleepy_hotel_zoo/bookingtype/packageroom.dart';
import 'package:sleepy_hotel_zoo/bookingtype/privateroom.dart';
import 'package:sleepy_hotel_zoo/utility/dialog.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';
import 'package:sleepy_hotel_zoo/widget/scan.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  int currentIndex = 0;
  List pages = [Info(), GroupRoom(), PackageRoom(), PrivateRoom(), Scan()];

  double screen;

  DateTime now = DateTime.now();
  DateTime date = DateTime.now();

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2016),
        lastDate: DateTime(2026));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(child: pages[currentIndex]),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        color: MyStyle().redColor,
        backgroundColor: MyStyle().lightColor,
        buttonBackgroundColor: Colors.white70,
        height: 50,
        items: <Widget>[
          Icon(Icons.info, size: 28, color: Colors.black),
          Icon(Icons.group_rounded, size: 28, color: Colors.black),
          Icon(Icons.house, size: 28, color: Colors.black),
          Icon(Icons.person, size: 28, color: Colors.black),
          Icon(Icons.camera_alt, size: 28, color: Colors.black),
        ],
        animationDuration: Duration(milliseconds: 200),
        index: 0,
        animationCurve: Curves.bounceInOut,
      ),
    );
  }

  RaisedButton buildRegister() => RaisedButton(
        onPressed: () {
          print('You clicked Me');
          selectTimePicker(context);
        },
        child: Text(
          'Booking NOW',
          style: TextStyle(color: Colors.pink),
        ),
        color: Colors.amber,
      );

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: MyStyle().darkColor,
      onPressed: () {},
      child: Icon(Icons.cloud_circle_rounded),
    );
  }
}
