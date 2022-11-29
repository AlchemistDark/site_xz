import 'package:flutter/material.dart';
import 'package:site_xz/planner_mine_screen_view.dart';
import 'package:site_xz/provider.dart';
import 'package:site_xz/test_rest_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Planner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(title: title);
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;
  final Provider provider = Provider();
  late String token;

  _MyHomePageState({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double mineWidth = MediaQuery.of(context).size.width;
    //return MinePlanner(title, mineWidth);
    return Buttons();
  }
}



