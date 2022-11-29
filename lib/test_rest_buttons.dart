import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:site_xz/person_class.dart';
//import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:site_xz/planner_mine_screen_view.dart';
import 'package:site_xz/provider.dart';

class Buttons extends StatelessWidget {

  final String url1 = 'https://qviz.fun/auth/token/login';
  final String url2 = 'https://qviz.fun/api/v1/plannerdata/';
  String token = '';
  late http.Response response;

  Future<void> getToken() async {  // Todo Добавить обработку исключений.
    http.Response response = await http.post(
      Uri.parse(url1),
      body: {
        'username':'NatalyaBloom',
        'password':'NatalyaPass',
      }
    );
    token = response.body.substring(response.body.indexOf(':')+2,response.body.length-2);
    print (token);
  }

  Future<void> sendRequestPost() async {
    http.Response result = await http.post(
        Uri.https('qviz.fun', 'api/v1/plannerdata/'),
        headers: {"Authorization": 'Token $token'}
    );
    response = result;
    print(response.body);
    print(utf8.decode(response.bodyBytes));
    print(jsonDecode(utf8.decode(response.bodyBytes)));
  }

  void getPerson(){
    Person person = Person.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    print(person);
    print('${person.userName}, ${person.region}, ${person.peopleCount}, ${person.peopleDates}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          onPressed: () async {await getToken();},
          backgroundColor: Colors.redAccent,
          child: const Text('Гет токен')
        ),
        FloatingActionButton(
          onPressed: () async {sendRequestPost();},
          backgroundColor: Colors.deepPurpleAccent,
          child: const Text('Гет боди'),
        ),
        FloatingActionButton(
          onPressed: getPerson,
          backgroundColor: Colors.amber,
          child: const Text('Гет боди'),
        )
      ]
    );
  }
}