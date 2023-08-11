import 'dart:async';
import 'dart:convert';

// import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;
import 'package:site_xz/global/person_class.dart';

/// Implements communication with the server.

class Provider{
  AuthState authState = AuthState(' ', false);
  ResponseState postResponse = ResponseState(http.Response(' ', 404), false);

  Stream<AuthState> get token => _tCtrl.stream;
  final StreamController<AuthState> _tCtrl = StreamController<AuthState>.broadcast();
  Stream<ResponseState> get pResponse => _rCtrl.stream;
  final StreamController<ResponseState> _rCtrl = StreamController<ResponseState>.broadcast();

  final String url1 = 'https://qviz.fun/auth/token/login';
  //final String url2 = 'https://qviz.fun/api/v1/plannerdata/';

  List<Contact> contactList = [];

  Provider(){
    auth();
  }

  Provider.withName(String name, String pass){
    auth2(name, pass);
  }

  Future auth2(String number, String pass) async {
    // var url = 'https://qviz.fun/auth/token/login';
    // var dio = Dio();
    // var response = await dio.post(
    //   url,
    //   data: {
    //     'phoneNumber': number,
    //     'password': pass
    //   }
    // );
    // final Map<String, dynamic> json = response.data as Map<String, dynamic>;
    // print ("json $json");
    // String token = json["auth_token"] as String;

    // print(response.data);
    // String token = response.data.substring(response.data.indexOf(':')+2,response.data.length-2);
    http.Response response = await http.post(
        Uri.parse(url1),
        body: {
          'phoneNumber': number,
          'password': pass
        },
        // headers: {
        //   'Access-Control-Allow-Headers': '*'
        // }
    );
    String token = response.body.substring(response.body.indexOf(':')+2,response.body.length-2);
    print("токен $token");
    authState = AuthState(token, true);
    _tCtrl.add(authState);
  }

  Future auth() async {
    http.Response response = await http.post(
      Uri.parse(url1),
      body: {
        'username':'NatalyaBloom',
        'password':'NatalyaPass',
      }
    );
    String token = response.body.substring(response.body.indexOf(':')+2,response.body.length-2);
    authState = AuthState(token, true);
    _tCtrl.add(authState);
  }

  Future<void> postRequest(String token) async {
    http.Response postR = await http.post(
      Uri.https('qviz.fun', 'api/v1/plannerdata/'),
      headers: {"Authorization": 'Token $token'}
    );
    print("юзер дата ${utf8.decode(postR.bodyBytes)}");
    postResponse = ResponseState(postR, true);
    _rCtrl.add(postResponse);
  }

  Future<void> contactListRequest(String token) async {
    contactList = [];
    http.Response postR = await http.post(
      Uri.https('qviz.fun', 'api/v1/peoplelist/'),
      headers: {"Authorization": 'Token $token'}
    );
    print('Token $token');
    final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
    print("json $json");
    var temp = (json["people"] as List<dynamic>);
    for (var i in temp){
      Contact contact = Contact.fromJson(i as Map<String, dynamic>);
      contactList.add(contact);
    }
    print("контакты $contactList");
    // print("имя ${contactList[1].name} айди ${contactList[1].id} ДР ${contactList[1].birthday} город ${contactList[1].region}");
    // print("фон ${contactList[1].phone} тг ${contactList[1].telegram} имэйл ${contactList[1].email}");
    // print("кат ${contactList[1].cat} пол ${contactList[1].sex} статус ${contactList[1].status}");
  }

  Future<List<Celebrate>> celebrationsListRequest(String token) async {
    List<Celebrate> celebrationsList = [];
    http.Response postR = await http.post(
        Uri.https('qviz.fun', 'api/v1/holidays/'),
        headers: {"Authorization": 'Token $token'}
    );
    print("праздники ${utf8.decode(postR.bodyBytes)}");
    final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
    var temp = (json["holidays"] as List<dynamic>);
    for (var i in temp){
      Celebrate celebrate = Celebrate.fromJson(i as Map<String, dynamic>);
      celebrationsList.add(celebrate);
    }
    print("контакты $celebrationsList");
    print("имя ${celebrationsList[1].name} дата ${celebrationsList[1].date}");//  ДР ${contactList[1].birthday} город ${contactList[1].region}");
    // print("фон ${contactList[1].phone} тг ${contactList[1].telegram} имэйл ${contactList[1].email}");
    // print("кат ${contactList[1].cat} пол ${contactList[1].sex} статус ${contactList[1].status}");
    return celebrationsList;
  }

  Future<List<ShortCelebrate>> getCelebrateName({required String token, required int id}) async {
    List<ShortCelebrate> celebrationsList = [];
    int cat = 0;
    switch(id) {
      case 0:
        cat = 2;
        break;
      case 1:
        cat = 3;
        break;
      case 2:
        cat = 1;
        break;
      case 3:
        return celebrationsList;
      case 4:
        cat = 5;
        break;
      case 5:
        cat = 8;
        break;
      case 6:
        cat = 7;
        break;
      case 7:
        cat = 6;
        break;
      case 8:
        cat = 4;
        break;
      default:
        return celebrationsList;
    }
    http.Response postR = await http.post(
      Uri.https('qviz.fun', 'api/v1/holiday_name/'),
      headers: {"Authorization": 'Token $token'},
      body: {"cat_id": "$cat"}
    );
    print("праздник нейм ${utf8.decode(postR.bodyBytes)}");
    final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
    var temp = (json["holiday_names"] as List<dynamic>);
    for (var i in temp){
      print("холидей нейм $i");
      Map<String, dynamic> tempMap = i as Map<String, dynamic>;
      ShortCelebrate tempCelebrate = ShortCelebrate(
        name: tempMap["holiday_name"],
        // month: stringDateToIntDate(tempMap["date"])[0],
        // day: stringDateToIntDate(tempMap["date"])[1],
        icon: tempMap["icon"] as int
      );
      print ("холидей парсе $tempCelebrate");
      celebrationsList.add(tempCelebrate);
    }
    return celebrationsList;
    // for (var i in temp){
    //   Celebrate celebrate = Celebrate.fromJson(i as Map<String, dynamic>);
    //   celebrationsList.add(celebrate);
    // }
    // print("контакты $celebrationsList");
    // print("имя ${celebrationsList[1].name} дата ${celebrationsList[1].date}");//  ДР ${contactList[1].birthday} город ${contactList[1].region}");
    // print("фон ${contactList[1].phone} тг ${contactList[1].telegram} имэйл ${contactList[1].email}");
    // print("кат ${contactList[1].cat} пол ${contactList[1].sex} статус ${contactList[1].status}");
    // return celebrationsList;
  }

  // List<int> stringDateToIntDate(String date) {
  //   List<int> result = [];
  //   List<String> temp = date.split(' ');
  //   if (date == "" || date == "nan" || temp.length != 2){
  //     return [0, 0];
  //   }
  //   print(date);
  //   switch(temp[1]){
  //     case 'января':
  //       result.add(1);
  //       break;
  //     case 'февраля':
  //       result.add(2);
  //       break;
  //     case 'марта':
  //       result.add(3);
  //       break;
  //     case 'апреля':
  //       result.add(4);
  //       break;
  //     case 'мая':
  //       result.add(5);
  //       break;
  //     case 'июня':
  //       result.add(6);
  //       break;
  //     case 'июля':
  //       result.add(7);
  //       break;
  //     case 'августа':
  //       result.add(8);
  //       break;
  //     case 'сентября':
  //       result.add(9);
  //       break;
  //     case 'октября':
  //       result.add(10);
  //       break;
  //     case 'ноября':
  //       result.add(11);
  //       break;
  //     case 'декабря':
  //       result.add(12);
  //       break;
  //     default:
  //       result.add(0);
  //   }
  //   result.add(int.tryParse(temp[0]) ?? 0);
  //   print("парсе $result");
  //   return result;
  // }

  Future<void> createCelebrate({required String token, required String name, required int category})async{
    Celebrate celebrate = Celebrate(
      id: 1000, // server JSON "id":421,
      name: name, // server JSON "name":"Свадебное торжество",
      date: "", // server JSON "date":"2022-07-07",
      month: 0, // server JSON "month":6,
      day: 0, // server JSON "day":8,
      celebrateCategory: [category], // server JSON "holiday_cat":1,
      peopleCategory: [], // server JSON "people_cat":1,
      icon: " " // server JSON "icons":"icon66"},
    );
    http.Response postR = await http.post(
        Uri.https('qviz.fun', 'api/v1/presentinfo/'),
        headers: {"Authorization": 'Token $token'},
        body: {"celebrate":"$celebrate"}
    );

    print("статус ${postR.statusCode}");
  }
//Celebrate{
//   final int id; // server JSON "id":421,
//   final String name; // server JSON "name":"Свадебное торжество",
//   final String date; // server JSON "date":"2022-07-07",
//   final int month; // server JSON "month":6,
//   final int day; // server JSON "day":8,
//   final List<int> celebrateCategory; // server JSON "holiday_cat":1,
//   final List<int> peopleCategory; // server JSON "people_cat":1,
//   final String icon; // server JSON "icons":"icon66"},



}

///

class AuthState {
  final String token;
  final bool isAuthSuccess;

  AuthState(this.token, this.isAuthSuccess);
}

class ResponseState {
  final http.Response response;
  final bool isSuccess;

  ResponseState(this.response, this.isSuccess);
}

class ShortCelebrate {
  final String name;
  // final int month;
  // final int day;
  final int icon;

  ShortCelebrate({
    required this.name,
    // required this.month,
    // required this.day,
    required this.icon
  });



}