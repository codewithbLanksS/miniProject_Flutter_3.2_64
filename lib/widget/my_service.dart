import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';
import 'package:sleepy_hotel_zoo/widget/information_login.dart';
import 'package:sleepy_hotel_zoo/widget/map.dart';
import 'package:sleepy_hotel_zoo/widget/show_room_list.dart';
import 'package:sleepy_hotel_zoo/widget/activity.dart';
import 'package:sleepy_hotel_zoo/widget/contact.dart';
import 'package:sleepy_hotel_zoo/widget/showmap.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String name, email;
  Widget currentWidget = ShowRoomList();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findNameAnEmail();
  }

  Future<Null> findNameAnEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event.displayName;
          email = event.email;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
      ),
      drawer: buildDrawer(),
      body: currentWidget,
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccountsDrawerHeader(),
              buildListTileShowRoomList(),
              buildListTileActivities(),
              buildListTileInformation(),
              buildListTileContact(),
              buildListTileShowMap(),
            ],
          ),
          buildSignOut(),
        ],
      ),
    );
  }

  ListTile buildListTileShowRoomList() {
    return ListTile(
      leading: Icon(
        Icons.meeting_room_outlined,
        size: 36,
      ),
      title: Text('Show Room List'),
      subtitle: Text('Show All room in HOTEL'),
      onTap: () {
        setState(() {
          currentWidget = ShowRoomList();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListTileInformation() {
    return ListTile(
      leading: Icon(
        Icons.perm_device_info,
        size: 36,
      ),
      title: Text('Information'),
      subtitle: Text('Information Of User Login'),
      onTap: () {
        setState(() {
          currentWidget = Information();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListTileActivities() {
    return ListTile(
      leading: Icon(
        Icons.sports_baseball_outlined,
        size: 36,
      ),
      title: Text('Activities'),
      subtitle: Text('All Activities'),
      onTap: () {
        setState(() {
          currentWidget = Activities();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListTileContact() {
    return ListTile(
      leading: Icon(
        Icons.contact_support_outlined,
        size: 36,
      ),
      title: Text('Booking Now'),
      subtitle: Text('Booking '),
      onTap: () {
        setState(() {
          currentWidget = Contact();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildListTileShowMap() {
    return ListTile(
      leading: Icon(
        Icons.map_outlined,
        size: 36,
      ),
      title: Text('Map'),
      subtitle: Text('Show Hotel Location'),
      onTap: () {
        setState(() {
          currentWidget = ShowLCT();
        });
        Navigator.pop(context);
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/logo4.jpg'), fit: BoxFit.cover),
      ),
      accountName: MyStyle().titleH3(name == null ? 'Name' : name),
      accountEmail: MyStyle().titleH3(email == null ? 'Email' : email),
      currentAccountPicture: Image.asset('images/logo.png'),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/authen', (route) => false));
            });
          },
          tileColor: MyStyle().darkColor,
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 36,
          ),
          title: MyStyle().titleH2white('Sign Out'),
          subtitle: MyStyle().titleH3white('Sign Out and Go to Authen'),
        ),
      ],
    );
  }
}
