import 'package:flutter/material.dart';
import 'package:routing/ChooseLocation.dart';
import 'package:routing/Home.dart';
import 'package:routing/Loading.dart';

void main() {
  runApp(
    MaterialApp(

      // initial route
      initialRoute: "/home",

      // mapping the respective widgets/pages to their routes
      routes: {
        "/home": (BuildContext context) => Home(),
        "/loading": (BuildContext context) => Loading(),
        "/location": (BuildContext context) => ChooseLocation()

      },
    )
  );
}
