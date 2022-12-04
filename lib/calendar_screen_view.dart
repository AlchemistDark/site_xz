import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:site_xz/paths.dart';
import 'package:site_xz/person_class.dart';
import 'package:site_xz/planner_app_bar.dart';
import 'package:site_xz/buttons.dart';
import 'package:site_xz/theme.dart';

import 'app_controller.dart';

/// Stub.

class CalendarScreen extends StatefulWidget {
  final String title;
  final AppController appController;

  const CalendarScreen(
    this.title,
    this.appController,
    {Key? key}
  ) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();

}

class _CalendarScreenState extends State<CalendarScreen> {

  _CalendarScreenState();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
      initialData: widget.appController.currentAppState,
      stream: widget.appController.state,
      builder: (context, snapshot) {
        AppTheme theme = snapshot.data!.theme;
        Person person = snapshot.data!.userData;
        print(theme.isDark);
        return Scaffold(
          appBar: PlannerAppBar(
            callBack: (){Navigator.pop(context);},
            controller: widget.appController,
            child: Container(
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
          body: Container(
            color: theme.mineColor,
            child: Column(
              children: <Widget>[
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
      }
    );
  }
}