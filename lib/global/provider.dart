import 'dart:async';
import 'dart:convert';

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
    http.Response response = await http.post(
        Uri.parse(url1),
        body: {
          'password': pass,
          'phoneNumber': number,
        }
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
    postResponse = ResponseState(postR, true);
    _rCtrl.add(postResponse);
  }

  Future<void> contactListRequest(String token) async {
    contactList = [];
    http.Response postR = await http.post(
      Uri.https('qviz.fun', 'api/v1/peoplelist/'),
      headers: {"Authorization": 'Token $token'}
    );
    final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
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
