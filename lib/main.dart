import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:site_xz/month_circular_face.dart';
import 'package:site_xz/planner_mine_screen.dart';
import 'package:site_xz/provider.dart';
import 'package:site_xz/star_up.dart';
//import 'package:http/http.dart' as http;


void main() {
  //document.documentElement!.requestFullscreen();
  //String token = await getToken();
  runApp(const MyApp());
  //print('token $token');

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
  State<MyHomePage> createState() => _MyHomePageState(title: title);
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;
  final Provider provider = Provider();
  late String _tkn;

  _MyHomePageState({Key? key, required this.title});

  @override
  void initState() {
    provider.auth();
    super.initState();
  }



  // void auth() async {
  //   provider.auth();
  // }
  // @override
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
    //document.documentElement!.requestFullscreen();
    //document.documentElement!.requestFullscreen();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    // print(provider.tkn);
    // provider.postRequest(provider.tkn);
    print(provider.authState.token);
    return StartPage(widget.title, mineWidth, mineHeight, widthScaleFactor, heightScaleFactor);
  }
}

// Future<void> response(String token) async {
//   Response respons = await post(
//     Uri.http("qviz.fun", "/api/v1/plannerdata/"),
//     headers: {"Authorization": token});
//   print(respons);
//   var data = json.decode(respons.body);
//   print('data $data');
//   for (var datas in data){
//     print('datas $data.leight');
//   }
// }

// Future<String> getToken() async{
//   var url = 'https://qviz.fun/auth/token/login';
//   String token = '';
//   var response =  await post(
//       Uri.parse(url),
//       body: {
//         'username':'NatalyaBloom',
//         'password':'NatalyaPass',
//       }
//   );
//   token = response.body.substring(response.body.indexOf(':')+2,response.body.length-2);
//   return token;
// }



