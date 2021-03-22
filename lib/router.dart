import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/widget/authen.dart';

import 'package:sleepy_hotel_zoo/widget/login.dart';
import 'package:sleepy_hotel_zoo/widget/my_service.dart';
import 'package:sleepy_hotel_zoo/widget/register.dart';
import 'package:sleepy_hotel_zoo/widget/scan.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen': (BuildContext context) => Authen(),
  '/register': (BuildContext context) => Register(),
  '/login': (BuildContext context) => Login(),
  '/myService': (BuildContext context) => MyService(),
  '/scan': (BuildContext context) => Scan(),
};
