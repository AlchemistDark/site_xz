import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_xz/paths.dart';
import 'package:site_xz/person_class.dart';
import 'package:site_xz/buttons.dart';
import 'package:site_xz/theme.dart';
import 'package:site_xz/month_circular_face_view.dart';
import 'package:site_xz/user_class.dart';
import 'dart:math' as math;

import 'app_controller.dart';


class CalendarScreen extends StatefulWidget {
  final String title;

  const CalendarScreen(this.title, {Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();

}

class _CalendarScreenState extends State<CalendarScreen> {
  //AppTheme theme;

  void _changeTheme(Person person) async {
    if (globalAppState.theme.isDark) {
      globalAppController
        .themeChange(AppState(userData: person, theme: AppTheme.light()));
    } else {
      globalAppController
        .themeChange(AppState(userData: person, theme: AppTheme.dark()));
    }
    setState(() {});
  }

  _CalendarScreenState();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
      initialData: globalAppState,
      stream: globalAppController.state,
      builder: (context, snapshot) {
      AppTheme theme = snapshot.data!.theme;
      Person person = snapshot.data!.userData;
      print(theme.isDark);
      return
      Scaffold(
      body: Container(
        color: theme.mineColor,
        child: Column(
          children: <Widget>[
            /// appBar. // ToDo пока вместо AppBar это, так как проще подогнать под дизайн. Но может всё же лучше настоящий AppBar...
            Container(
              color: theme.appBarColor,
              height: 49,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 14),
                    child: GradientAnimatedButton(
                      theme: theme,
                      iconPath: backButtonIcon,
                      onPressed: (){Navigator.pop(context); print('сделано');}, // ToDo у других окон оставить Navigator
                    )
                  ),
                  Expanded(
                    child: Container(
                      //margin: const EdgeInsets.only(top: 4),
                      alignment: Alignment.center,
                      child: Text(
                        "Календарь",
                        style: TextStyle(
                          color: theme.appBarTextColor,
                          fontSize: 17,
                          fontFamily: 'Roboto'
                        ),
                      ),
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 14),
                    child: GradientAnimatedButton(
                      theme: theme,
                      iconPath: theme.isDark? sunButtonIcon : moonButtonIcon,
                        onPressed: (){
                          _changeTheme(
                            snapshot.data!.userData,
                          );
                        }
                    )
                  )
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Container()
            ),
            /// navBar. // ToDo
            Container(
              height: 46,
              padding: const EdgeInsets.all(0.0),
              margin: const EdgeInsets.all(0.0),
              color: appBarDarkColor,
              child: Row(
                children: const [
                Text('Здесь будет navBar') // ToDo
                //  FloatingActionButton(
                //    onPressed: () => {},
                            //    foregroundColor: Color(0xFF00FF00),
                            //    backgroundColor: Color(0xFFFFFF00),
                            //    //hoverColor: Color(0xFFFF0000),
                            //    elevation: 5.0,
                            //      child:
                            //      (const Icon(
                            //        Icons.arrow_back_ios_new,
                            //        color: Color(0xFFBBBBBB),
                            //      ))
                            //  ),
                            //  RawMaterialButton(
                            //    onPressed: () {},
                            //    elevation: 2.0,
                            //    child: const Icon(
                            //      Icons.wb_sunny_outlined,
                            //      color: appBarDarkColor,
                            //    )
                            // ),
                            // padding: const EdgeInsets.all(0.0),
                          ]
                      )
                  ),
                ]
            )
        )
    );
  });
}}