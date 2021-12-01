import 'package:flutter/material.dart';
import 'package:news/screens/web_viewer.dart';

import 'package:news/screens/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/viewer' : (context) => NewsViewer()
    },
  ));
}
