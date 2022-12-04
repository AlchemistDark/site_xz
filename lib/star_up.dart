import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:site_xz/provider.dart';
import 'package:site_xz/app_controller.dart';
import 'package:site_xz/person_class.dart';
import 'package:site_xz/planner_mine_screen_view.dart';

/// Contacts the server and initializes application variables.

class StartPage extends StatelessWidget {

  final Provider provider = Provider();
  late String responseAnswer;
  late Person person;

  final String title;
  final double mineWidth;

  StartPage(
    this.title,
    this.mineWidth,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: provider.token,
      initialData: provider.authState,
      builder: (context, AsyncSnapshot<AuthState> snapshot) {
        final state = snapshot.data;
        switch (state!.isAuthSuccess) {
          case false:
            return const Text('Данные не загружены');
          case true:
            if (!provider.postResponse.isSuccess) {
              provider.postRequest(state.token);
            }
            return StreamBuilder<ResponseState>(
              stream: provider.pResponse,
              initialData: provider.postResponse,
              builder: (context, AsyncSnapshot<ResponseState> snapshot) {
                final state = snapshot.data;
                switch (state!.isSuccess) {
                  case false:
                    return const Text('Данные загружаются');
                  case true:
                    responseAnswer = utf8.decode(provider.postResponse.response.bodyBytes);
                    // ToDo надо исправить ошибку SyntaxError: Unexpected end of JSON input
                    // ToDo эта ошибка происходит и при изменении размеров окна
                    //Future.delayed(const Duration(seconds: 3), (){
                    //print('всё');
                    //print(responseAnswer);
                      person = Person.fromJson(jsonDecode(responseAnswer));
                      AppController appController = AppController(person);
                      return MinePlanner(title, mineWidth, appController);
                    //});
                    //return MinePlanner(title, mineWidth);
                }
                return const Text('Что-то пошло не так...');
              }
            );
        }
        return const Text('Что-то пошло не так...');
      }
    );
  }
}



