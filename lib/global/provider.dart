import 'dart:async';

import 'package:http/http.dart' as http;

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

  Provider(){
    auth();
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
