import 'dart:async';
import 'package:flutter/material.dart';

import 'package:site_xz/month_circular_face.dart';
import 'package:site_xz/monthly_planner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner', //ToDo это надо изменить.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Planner'), //ToDo это надо изменить.
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final double mineWidth = MediaQuery.of(context).size.width;
    final double mineHeight = MediaQuery.of(context).size.height;
    final double widthScaleFactor = mineWidth / 375;
    final double heightScaleFactor = mineWidth / 825;
    return MonthlyPlanner(widget.title, mineWidth, mineHeight, widthScaleFactor, heightScaleFactor);
  }
}
