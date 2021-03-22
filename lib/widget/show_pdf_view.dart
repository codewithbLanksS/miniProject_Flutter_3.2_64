import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:sleepy_hotel_zoo/models/room_model.dart';
import 'package:sleepy_hotel_zoo/utility/my-style.dart';

class ShowPdfView extends StatefulWidget {
  final RoomModel roomModel;
  ShowPdfView({Key key, this.roomModel}) : super(key: key);
  @override
  _ShowPdfViewState createState() => _ShowPdfViewState();
}

class _ShowPdfViewState extends State<ShowPdfView> {
  RoomModel model;
  PDFDocument pdfDocument;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.roomModel;
    createPDFDocument();
  }

  Future<Null> createPDFDocument() async {
    try {
      var result = await PDFDocument.fromURL(model.pdf);
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
