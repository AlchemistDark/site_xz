import 'dart:async';

import 'package:site_xz/person_class.dart';
import 'package:site_xz/theme.dart';

/// Coordinates the work of different modules.

class AppController{
  final Person userData;
  late AppState currentAppState;

  Stream<AppState> get state => _sCtrl.stream;
  final StreamController<AppState> _sCtrl = StreamController<AppState>.broadcast();

  /// Constructor.
  AppController(this.userData) {
    currentAppState = AppState(userData: userData, theme: AppTheme.light());
    _sCtrl.add(currentAppState);
  }

  void themeChange(AppState appState) {
    _sCtrl.add(appState);
    currentAppState = appState;
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