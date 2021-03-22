import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('images/logo.png'),
        title: Text(
          'Normal Dialog',
          style: MyStyle().redBoldStyle(),
        ),
        subtitle: Text(string),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
      ],
    ),
  );
}
