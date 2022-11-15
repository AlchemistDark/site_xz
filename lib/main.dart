import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:site_xz/month_circular_face.dart';
import 'package:site_xz/planner_mine_screen.dart';
//import 'package:http/http.dart' as http;


void main() {
  //document.documentElement!.requestFullscreen();
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
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   document.documentElement!.requestFullscreen();
  // }

  @override
  Widget build(BuildContext context) {
    final double mineWidth = MediaQuery.of(context).size.width;
    final double mineHeight = MediaQuery.of(context).size.height;
    final double widthScaleFactor = mineWidth / 375;
    final double heightScaleFactor = mineWidth / 825;
    //SystemChrome.setEnabledSystemUIOverlays([]);
    //setState(() {document.documentElement!.requestFullscreen();});
    //response();
    //document.documentElement!.requestFullscreen();
    //document.documentElement!.requestFullscreen();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return (MonthlyPlanner(widget.title, mineWidth, mineHeight, widthScaleFactor, heightScaleFactor));
  }
}

// Future<void> response() async {
//   Response respons = await post(
//     Uri.http("qviz.fun", "/api/v1/plannerdata/"),
//     headers: {"Authorization": ""});
//   print(respons);
//   var data = json.decode(respons.body);
//   print('data $data');
//   for (var datas in data){
//     print('datas $data.leight');
//   }
// }


