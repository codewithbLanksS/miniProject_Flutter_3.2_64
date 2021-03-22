import 'package:flutter/material.dart';
import 'package:sleepy_hotel_zoo/widget/mapserviceapplicationbloc.dart';
import 'package:sleepy_hotel_zoo/widget/mapwidget.dart';
import 'package:provider/provider.dart';

class ShowLCT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: ShowLocation(),
    );
  }
}
