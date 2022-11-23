import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:site_xz/planner_mine_screen_view.dart';
import 'package:site_xz/provider.dart';

class StartPage extends StatelessWidget {

  final Provider provider = Provider();

  final String title;
  final double mineWidth;
  final double mineHeight;
  final double widthScaleFactor;
  final double heightScaleFactor;

  StartPage(
    this.title,
    this.mineWidth,
    this.mineHeight,
    this.widthScaleFactor,
    this.heightScaleFactor,
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
                    print("response: ${provider.postResponse.response.body}");
                    return MinePlanner(title, mineWidth);
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

