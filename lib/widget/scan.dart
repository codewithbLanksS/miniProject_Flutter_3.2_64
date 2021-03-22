import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/models/bill_model.dart';
import 'package:sleepy_hotel_zoo/models/booking_model.dart';
import 'package:sleepy_hotel_zoo/utility/dialog.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sleepy_hotel_zoo/widget/register.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

double screen;
String email, accountname, account, uid;

Widget picture() {
  return Center(
    child: Container(
      child: Image.asset('images/bill.jpg'),
      width: screen * 0.5,
    ),
  );
}

Widget texttop() {
  return Center(
    child: Text(
      'SCB 4092009137',
      style: TextStyle(
          color: MyStyle().darkColor,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    ),
  );
}

Widget text() {
  return Center(
    child: Text(
      'รายละเอียดการโอนเงิน',
      style: TextStyle(
          color: MyStyle().darkColor,
          fontWeight: FontWeight.bold,
          fontSize: 18),
    ),
  );
}

Widget text2() {
  return Center(
    child: Text(
      ' **กรอกข้อมูลด้านล่าง** ',
      style: TextStyle(
          color: MyStyle().darkColor,
          fontWeight: FontWeight.bold,
          fontSize: 12),
    ),
  );
}

Container buildEmail() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), color: Colors.white70),
    margin: EdgeInsets.only(top: 20),
    width: screen * 0.7,
    height: 40,
    child: TextField(
      onChanged: (value) => email = value.trim(),
      style: TextStyle(color: MyStyle().darkColor),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: MyStyle().darkColor),
        hintText: 'Email ที่ใช้เข้าสู้ระบบ :',
        prefixIcon: Icon(Icons.fingerprint),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: MyStyle().darkColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: MyStyle().lightColor),
        ),
      ),
    ),
  );
}

Container buildAccountName() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), color: Colors.white70),
    margin: EdgeInsets.only(top: 20),
    width: screen * 0.7,
    height: 40,
    child: TextField(
      onChanged: (value) => accountname = value.trim(),
      style: TextStyle(color: MyStyle().darkColor),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: MyStyle().darkColor),
        hintText: 'ชื่อบัญชี:',
        prefixIcon: Icon(Icons.fingerprint),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: MyStyle().darkColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: MyStyle().lightColor),
        ),
      ),
    ),
  );
}

Future<Null> scanBill() async {
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      uid = event.uid;
      print('############### uid = $uid');

      billModel model = billModel(
          email: email,
          accountname: accountname,
          account: account,
          status: 'waitting');

      Map<String, dynamic> data = model.toMap();
      await FirebaseFirestore.instance
          .collection('bill')
          .doc(uid)
          .set(data)
          .then((value) => print('eiei'));
    });
  });
}

Container buildAccount() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25), color: Colors.white70),
    margin: EdgeInsets.only(top: 20),
    width: screen * 0.7,
    height: 40,
    child: TextField(
      onChanged: (value) => account = value.trim(),
      style: TextStyle(color: MyStyle().darkColor),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: MyStyle().darkColor),
        hintText: 'หมายเลขบัญชี 4 หลักสุดท้าย :',
        prefixIcon: Icon(Icons.fingerprint),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: MyStyle().darkColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: MyStyle().lightColor),
        ),
      ),
    ),
  );
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            text(),
            Padding(padding: EdgeInsets.all(5)),
            texttop(),
            Padding(padding: EdgeInsets.all(5)),
            text2(),
            buildEmail(),
            buildAccountName(),
            buildAccount(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: MyStyle().darkColor,
      onPressed: () {
        print(uid);
        print('email = $email,accountname =$accountname, account=$account');
        scanBill();
      },
      child: Icon(Icons.cloud_circle_rounded),
    );
  }
}
