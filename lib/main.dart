import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/planner_mine_screen_view.dart';
import 'package:site_xz/star_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Planner',
      // ToDo возможно здесь будет нужна навигация. Пока X3 какая имеено.
      // const перед MaterialApp надо будет убрать
      // routes: <String, WidgetBuilder> {
      //   '/': (BuildContext context) => MyHomePage(title: 'Planner'),
      //   '/planner': (BuildContext context) => MinePlanner('Planner', MediaQuery.of(context).size.width, )
      // },
      home: MyHomePage(title: 'Planner')
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

  _MyHomePageState({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double mineWidth = MediaQuery.of(context).size.width;
    //return MinePlanner(title, mineWidth);
    return StartPage(title, mineWidth);
  }
}



