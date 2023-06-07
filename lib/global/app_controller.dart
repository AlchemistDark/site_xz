import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/provider.dart';
import 'package:site_xz/global/theme.dart';

/// Coordinates the work of different modules.

class AppController{
  final Person userData;
  late AppState currentAppState;
  List<Contact> contactList;

  Stream<AppState> get state => _sCtrl.stream;
  final StreamController<AppState> _sCtrl = StreamController<AppState>.broadcast();

  /// Constructor.
  AppController(this.userData, this.contactList) {
    currentAppState = AppState(userData: userData, contactList: contactList, theme: AppTheme.light());
    _sCtrl.add(currentAppState);
  }

  void themeChange(AppState appState) {
    _sCtrl.add(appState);
    currentAppState = appState;
  }

  Future<void> contactDelete(int id, String token)async {
    Provider provider = Provider();
    http.Response postR = await http.delete(
      Uri.https('qviz.fun', 'api/v1/people/$id'),
      headers: {"Authorization": 'Token $token'},
    );
    print("Удаление $id статус ${postR.statusCode}");
    await provider.contactListRequest(token);
    contactList = provider.contactList;
    currentAppState = AppState(userData: userData, contactList: contactList, theme: AppTheme.light());
    _sCtrl.add(currentAppState);
  }

  Future<void> contactCreate(
    String token,
    String name,
    String date,
    String phone,
    String telegram,
    String city,
    String sex,
    String status,
    String cat,
  ) async {
    Provider provider = Provider();
    final body = {
      "name": name,
      "person_photo": " ",
      "birthday": date,
      "sex": sex,
      "phoneNumber": phone,
      "telegram": telegram,
      "email": "ff@ff.ff",
      "region": city,
      "status": status,
      "cat": cat
    };
    http.Response postR = await http.post(
        Uri.https('qviz.fun', 'api/v1/people/'),
        headers: {"Authorization": 'Token $token'},
        body: body
    );
    print("добавление статус ${postR.statusCode}");
    await provider.contactListRequest(token);
    contactList = provider.contactList;
    currentAppState = AppState(userData: userData, contactList: contactList, theme: AppTheme.light());
    _sCtrl.add(currentAppState);
  }

  Future<void> contactUpdate({
    required int id,
    required String token,
    required String name,
    required String date,
    required String phone,
    required String telegram,
    required String city,
    required String sex,
    required String status,
    required String cat
  }) async {
    Provider provider = Provider();
    final body = {
      "name": name,
      "person_photo": " ",
      "birthday": date,
      "sex": sex,
      "phoneNumber": "+79998887777",
      "telegram": telegram,
      "email": "ff@ff.ff",
      "region": city,
      "status": status,
      "cat": cat
    };
    http.Response postR = await http.put(
        Uri.https('qviz.fun', 'api/v1/people/$id/'),
        headers: {"Authorization": 'Token $token'},
        body: body
    );
    print("изменение статус ${postR.statusCode}");
    print(postR.body);
    await provider.contactListRequest(token);
    contactList = provider.contactList;
    currentAppState = AppState(userData: userData, contactList: contactList, theme: AppTheme.light());
    _sCtrl.add(currentAppState);
  }

}

class AppState{
  final Person userData;
  final List<Contact> contactList;
  final AppTheme theme;

  AppState({
    required this.userData,
    required this.contactList,
    required this.theme
  });
}