import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/models/room_model.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';
import 'package:sleepy_hotel_zoo/widget/show_pdf_view.dart';

class ShowRoomList extends StatefulWidget {
  @override
  _ShowRoomListState createState() => _ShowRoomListState();
}

class _ShowRoomListState extends State<ShowRoomList> {
  List<Widget> widgets = [];
  List<RoomModel> roomModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      await FirebaseFirestore.instance
          .collection('typeroom')
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          print('map = $map');
          RoomModel model = RoomModel.fromMap(map);
          roomModels.add(model);
          print('name = ${model.name}');
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWidget(RoomModel model, int index) => GestureDetector(
        onTap: () {
          print('You Click from index =$index');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShowPdfView(
                  roomModel: roomModels[index],
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
