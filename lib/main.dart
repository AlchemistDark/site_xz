import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:site_xz/mok_up.dart';

import 'package:url_strategy/url_strategy.dart';

import 'package:site_xz/calendar_screen_view.dart';
import 'package:site_xz/star_up.dart';
import 'package:site_xz/global/app_controller.dart';
import 'package:site_xz/main_screen/planner_main_screen_view.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
  // ToDo добавить возможность зайти без логина.
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartPage.route,
      routes: {
        MainPlanner.route: (context) => MainPlanner(
          'Planner',
          ModalRoute.of(context)!.settings.arguments as double,
          ModalRoute.of(context)!.settings.arguments as AppController
        ),
        CalendarScreen.route: (context) => CalendarScreen(
          'Planner',
          ModalRoute.of(context)!.settings.arguments as AppController
        )
      },
      title: 'Planner',
      home: const MyHomePage(title: 'Planner')
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
    final double mainWidth = MediaQuery.of(context).size.width;
    //return MainPlanner(title, mainWidth);
    return StartPage(title, mainWidth);
  }
}



