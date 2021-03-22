import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/models/activities_model.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';
import 'package:sleepy_hotel_zoo/widget/show_image_view.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  List<Widget> widgets = [];
  List<ActivitiesModel> activitiesModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      await FirebaseFirestore.instance
          .collection('activities')
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('map = $map');
          ActivitiesModel model = ActivitiesModel.fromMap(map);
          activitiesModels.add(model);
          print('name = ${model.name}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWidget(ActivitiesModel model, int index) => GestureDetector(
        onTap: () {
          print('You Click from index =$index');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowImageView(
                  activitiesModel: activitiesModels[index],
                ),
              ));
        },
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  child: Image.network(model.cover),
                ),
                SizedBox(
                  height: 16,
                ),
                MyStyle().titleH2(model.name),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : GridView.extent(maxCrossAxisExtent: 210, children: widgets),
    );
  }
}
