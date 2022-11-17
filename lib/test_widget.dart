import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:site_xz/planner_mine_screen.dart';
import 'package:site_xz/provider.dart';

class TestWidget extends StatefulWidget {
  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {

  final String url = 'https://qviz.fun/auth/token/login';
  String? body;
  int? status;

  Future<String> getToken() async {  // Todo Добавить обработку исключений.
    http.Response response = await http.post(
      Uri.parse(url),
      body: {
        'username':'username',
        'password':'userpass',
      }
    );
    String token = response.body.substring(response.body.indexOf(':')+2,response.body.length-2);
    return token;
  }

  Future<void> sendRequestPost() async {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Authorization": await getToken()}
    );
    //postResponse = ResponseState(postR, true);
    //_rCtrl.add(postResponse);
    print(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    sendRequestPost();
    return Text('всё');
  }
}
