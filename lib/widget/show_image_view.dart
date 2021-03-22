import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:sleepy_hotel_zoo/models/activities_model.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';

class ShowImageView extends StatefulWidget {
  final ActivitiesModel activitiesModel;
  ShowImageView({Key key, this.activitiesModel}) : super(key: key);
  @override
  _ShowImageViewState createState() => _ShowImageViewState();
}

class _ShowImageViewState extends State<ShowImageView> {
  ActivitiesModel model;
  PDFDocument pdfDocument;

  @override
  void initState() {
    super.initState();
    model = widget.activitiesModel;
    createPDFDocument();
  }

  Future<Null> createPDFDocument() async {
    try {
      var result = await PDFDocument.fromURL(model.image);
      setState(() {
        pdfDocument = result;
      });
    } catch (e) {
      print('e ==> ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text(model.name == null ? 'See Room' : model.name),
      ),
      body: pdfDocument == null
          ? Center(child: CircularProgressIndicator())
          : PDFViewer(document: pdfDocument),
    );
  }
}
