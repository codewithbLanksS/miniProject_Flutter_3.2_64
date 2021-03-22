import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

Widget picture() {
  return Container(
    child: Image.asset('images/hotel.jpg'),
    width: 270,
  );
}

Widget text() {
  return Text(
    'ข้อมูลและรายละเอียดการจอง',
    style: TextStyle(
        color: MyStyle().darkColor, fontWeight: FontWeight.bold, fontSize: 22),
  );
}

Widget text2() {
  return Text(
    ' 1. ห้องรวม 490 บาท / คืน \n 2. ห้องแบบเหมา 3500 บาท / คืน \n 3. ห้องแบบส่วนตัว 1200 บาท / คืน ',
    style: TextStyle(
        color: MyStyle().darkColor, fontWeight: FontWeight.bold, fontSize: 18),
  );
}

Widget text3() {
  return Text(
    '-เลือกรูปแบบห้องตามแถบด้านล่างและกรอกข้อมูล \n-เลือกรูปกล้องที่แถบด้านล่างเพื่อกรอกข้อมูลการจ่ายเงิน',
    style: TextStyle(
        color: MyStyle().darkColor, fontWeight: FontWeight.bold, fontSize: 18),
  );
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              text(),
              Padding(padding: EdgeInsets.all(10)),
              picture(),
              Padding(padding: EdgeInsets.all(5)),
              text2(),
              Padding(padding: EdgeInsets.all(5)),
              text3(),
            ],
          ),
        ),
      ),
    );
  }
}
