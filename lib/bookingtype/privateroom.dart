import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/models/booking_model.dart';
import 'package:sleepy_hotel_zoo/utility/dialog.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sleepy_hotel_zoo/widget/register.dart';

class PrivateRoom extends StatefulWidget {
  @override
  _PrivateRoomState createState() => _PrivateRoomState();
}

Widget picturepv() {
  return Container(
    child: Image.asset('images/privateroomin.jpg'),
    width: 270,
  );
}

Widget text() {
  return Text(
    'ห้องพักแบบส่วนตัว',
    style: TextStyle(
        color: MyStyle().darkColor, fontWeight: FontWeight.bold, fontSize: 22),
  );
}

class _PrivateRoomState extends State<PrivateRoom> {
  @override
  void initState() {
    super.initState();
  }

  int priceforone = 1200;
  double screen;
  String typeroom, dayout, dayin, uid;
  int daybook, allprice;
  String name, user, password;
  DateTime now = DateTime.now();
  DateTime date = DateTime.now();

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime.now(),
        lastDate: DateTime(2026));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  Future<Null> findUid() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        uid = event.uid;
        print('############### uid = $uid');

        bookingModel model = bookingModel(
            typeroom: 'Private Room',
            allprice: (date.day.toInt() - now.day.toInt()) * priceforone,
            daybook: date.day.toInt() - now.day.toInt(),
            dayout:
                'วันที่ ${now.day.toString()} เดือน ${now.month.toString()} ปี ${now.year.toString()}',
            dayin:
                'วันที่ ${date.day.toString()} เดือน ${date.month.toString()} ปี ${date.year.toString()}');

        Map<String, dynamic> data = model.toMap();
        await FirebaseFirestore.instance
            .collection('booking')
            .doc(uid)
            .set(data)
            .then((value) => print('eiei'));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            text(),
            Padding(padding: EdgeInsets.all(10)),
            picturepv(),
            Padding(padding: EdgeInsets.all(10)),
            Text(
                'วันนี้วันที่ ${now.day.toInt()} เดือน ${now.month.toInt()} ปี ${now.year.toInt()}'),
            Padding(padding: EdgeInsets.all(10)),
            buildRegister(),
            Padding(padding: EdgeInsets.all(10)),
            Text(
                'สิ้นสุดการเข้าพักวันที่ ${date.day.toInt()} เดือน ${date.month.toInt()} ปี ${date.year.toInt()}'),
            Padding(padding: EdgeInsets.all(10)),
            Text(
                'รวมเข้าพักทั้งสิ้น ${date.day.toInt() - now.day.toInt()} วัน'),
            Padding(padding: EdgeInsets.all(10)),
            Text(
                'รวมค่าใช้จ่าย ${(date.day.toInt() - now.day.toInt()) * priceforone} บาท'),
          ],
        ),
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
      onPressed: () {
        print('name = $name,user =$user, password=$password');
        print(
            'วันที่ปัจจุบัน ${now.day.toInt()} เดือน ${now.month.toInt()} ปี ${now.year.toInt()},สิ้นสุดการเข้าพักวันที่ ${date.day.toInt()} เดือน ${date.month.toInt()} ปี ${date.year.toInt()},รวมเข้าพักทั้งสิ้น ${date.day.toInt() - now.day.toInt()} วัน,รวมค่าใช้จ่าย ${(date.day.toInt() - now.day.toInt()) * 490} บาท');
        findUid();
      },
      child: Icon(Icons.cloud_circle_rounded),
    );
  }
}
