import 'dart:async';

import 'package:http/http.dart';

class Provider{
  late AuthState authState;
  late ResponseState postResponse;
  Stream<AuthState> get token => _tCtrl.stream;
  final StreamController<AuthState> _tCtrl = StreamController<AuthState>.broadcast();
  Stream<ResponseState> get pResponse => _rCtrl.stream;
  final StreamController<ResponseState> _rCtrl = StreamController<ResponseState>.broadcast();
  Provider(){
    authState = AuthState('pass', false);
    postResponse = ResponseState(null, false);
    auth();
  }

  Future auth() async {
    String url = 'https://qviz.fun/auth/token/login';
    Response response =  await post(
      Uri.parse(url),
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
    String url = 'qviz.fun/api/v1/plannerdata/';
    Response postR = await post(
      Uri.parse(url),
      headers: {"Authorization": token}
    );
    postResponse = ResponseState(postR, true);
    _rCtrl.add(postResponse);
    print('res: ${postResponse.response}');
  }
}

class AuthState {
  final String token;
  final bool isAuthSuccess;

  AuthState(this.token, this.isAuthSuccess);
}

class ResponseState {
  final Response? response;
  final bool isSuccess;

  ResponseState(this.response, this.isSuccess);
}
