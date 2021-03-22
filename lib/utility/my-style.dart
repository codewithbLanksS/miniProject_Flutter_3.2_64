import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Color(0xffbb8b8a);
  Color primaryColor = Color(0xffeebbba);
  Color lightColor = Color(0xffffeeec);
  Color redColor = Color(0xffffff8983);

  BoxDecoration boxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(25), color: Colors.white70);

  TextStyle redBoldStyle() => TextStyle(
        color: Colors.red.shade700,
        fontWeight: FontWeight.bold,
      );

  Widget showlogo() => Image.asset('images/logo.png');

  Widget titleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: darkColor,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: darkColor,
        ),
      );

  Widget titleH2white(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );

  Widget titleH3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          color: darkColor,
        ),
      );

  Widget titleH3white(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white54,
        ),
      );

  MyStyle();
}
