import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double screen;
  bool statusRedEye = true;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(0, -0.3),
              radius: 1,
              colors: <Color>[Colors.white, MyStyle().lightColor]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildLogo(),
                MyStyle().titleH1('Sleepy Hotel Zoo'),
                MyStyle().titleH1(''),
                buildgotologin(),
                buildSignInEmail(),
                buildSignInGoogle(),
                buildSignInFacebook(),
                buildSignInApple(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildSignInEmail() => Container(
        margin: EdgeInsets.only(top: 8),
        child: SignInButton(
          Buttons.Email,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );

  Container buildSignInGoogle() => Container(
        margin: EdgeInsets.only(top: 8),
        child: SignInButton(
          Buttons.GoogleDark,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );

  Container buildSignInFacebook() => Container(
        margin: EdgeInsets.only(top: 8),
        child: SignInButton(
          Buttons.FacebookNew,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );

  Container buildSignInApple() => Container(
        margin: EdgeInsets.only(top: 8),
        child: SignInButton(
          Buttons.AppleDark,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      );

  Container buildgotologin() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: screen * 0.6,
      height: screen * 0.13,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/authen'),
        child: Text('LOGIN or Register'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().redColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      width: screen * 0.4,
      child: MyStyle().showlogo(),
    );
  }
}
