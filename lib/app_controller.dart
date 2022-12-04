import 'dart:async';

import 'package:site_xz/person_class.dart';
import 'package:site_xz/theme.dart';

/// Global variables for application state.
AppState globalAppState = AppState(
  userData: Person(
   userName: 'userName',
   region: "region",
   celebrates: [],
   peopleDates: [],
   peopleCount: []
  ),
  theme: AppTheme.light()
);

AppController globalAppController = AppController(globalAppState.userData);
/// End of global variables bloc.

class AppController{
  final Person userData;
  late AppState appState;

  Stream<AppState> get state => _sCtrl.stream;
  StreamController<AppState> _sCtrl = StreamController<AppState>.broadcast();

  AppController(this.userData) {
    appState = AppState(userData: userData, theme: AppTheme.light());
    _sCtrl.add(appState);
    globalAppState = appState;
  }

  void themeChange(AppState appState) {
    print("смена темы");
    _sCtrl.add(appState);
    globalAppState = appState;
  }

}

class AppState{
  final Person userData;
  final AppTheme theme;

  AppState({
    required this.userData,
    required this.theme
  });
}