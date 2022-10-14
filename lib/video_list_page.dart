import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoListPage extends StatefulWidget {
  const VideoListPage({Key? key}) : super(key: key);

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  ThemeEnum pageTheme = ThemeEnum.light;
  IconData topButtonsIcon = Icons.wb_sunny_outlined;

  //ToDo костыль-заглушка
  List<String> videos = <String>["Мои благодарности", "Мимимишные", "С юморком", "In English", "Кофейные истории"];
  List<String> numbers = <String>["09", "19", "27", "35", "40"];


  ///Block of colors and paths. Initialization set to light theme.
  Color _navBarColor = navBarLightColor;
  Color _mineFontColor = mineFontLightColor;
  Color _backgroundColor = backgroundLightColor;
  Color _listColor = listLightColor;
  String _backArrowBt = backArrowBtLight;
  String _themeArrowBt = themeArrowBtLight;
  Color _numbersColor = numbersLightColor;
  Color _listTextColor = listTextLightColor;
  String _llBt = llBtLight;
  String _clBt = clBtLight;
  String _ccBt = ccBtLight;
  String _crBt = crBtLight;
  String _rrBt = rrBtLight;



  // mineFontLightColor = Color(0xFF393939)
  // const navBarDarkColor = Color(0xFF282A31);

  Color _buttonColor = const Color(0xFF9DA7B0);
  //Color _backgroundColor = Color(0xFFE5E5E5);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: _navBarColor,
            child: Row(
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  //fillColor: _buttonColor,
                  child: ClipOval(
                    child: Image.asset(_backArrowBt)
                  ),
                  padding: const EdgeInsets.all(0.0),
                ),
                if (pageTheme == ThemeEnum.light) const Expanded(
                  child: Text("Содержание номера",
                    style: TextStyle(
                      color: mineFontLightColor,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  )
                ),
                if (pageTheme == ThemeEnum.dark) const Expanded(
                  child: Text("Содержание номера",
                    style: TextStyle(
                      color: mineFontDarkColor,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  )
                ),
                //if (pageTheme == ThemeEnum.light)
                RawMaterialButton(
                  onPressed: () {changeTheme();},
                  elevation: 2.0,
                  //fillColor: _buttonColor,
                  child: ClipOval(
                    child: Image.asset(_themeArrowBt)
                  ),
                  padding: const EdgeInsets.all(0.0),
                ),
              ]
            ),
          )   ,
          Flexible (child:
          Container(
            color: _backgroundColor,
            //margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 9.0),
            //padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 9.0),
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    color: _listColor,
                    margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 9.0),
                    padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                    child: Row(
                      children: [
                        if (pageTheme == ThemeEnum.light)
                          Text(
                            numbers[index],
                            style: const TextStyle(
                              color: numbersLightColor,
                              fontSize: 28,
                              fontFamily: 'Gputeks'
                            )
                          ),
                        if (pageTheme == ThemeEnum.dark)
                          Text(
                            numbers[index],
                            style: const TextStyle(
                              color: numbersDarkColor,
                              fontSize: 28,
                              fontFamily: 'Gputeks'
                            )
                          ),
                        Container(
                          width: 29,
                        ),
                        if (pageTheme == ThemeEnum.light)
                          Text(
                              videos[index],
                              style: const TextStyle(
                                  color: listTextLightColor,
                                  fontSize: 18,
                                  fontFamily: 'Roboto'
                              )
                          ),
                        if (pageTheme == ThemeEnum.dark)
                          Text(
                            videos[index],
                            style: const TextStyle(
                              color: listTextDarkColor,
                              fontSize: 18,
                              fontFamily: 'Roboto'
                            )
                          )
                      ],
                    )

                );
              //Text(videos[index], style: TextStyle(fontSize: 22));
            })),
            // ToDo Код на будущее для асинхронного создания списка
            // StreamBuilder<TasksViewModel>(
            //   initialData: present.lastState,
            //   stream: present.states,
            //   builder: (context, snapShot) {
            //     final lst = snapShot.data!;
            //     ListView lV = ListView.builder(
            //       itemCount: lst.items.length,                                           // Эта строка сообщает ListView.builder сколько всего элементов в списке.
            //       itemBuilder: (BuildContext context, int index) {
            //         return TaskWidget(                                                   // Виджет описан в классе на строке 5.
            //           task: lst.items[index],
            //           isSelected: _selectedTasksIndexes.contains(index),
            //           onSelected: (){setState((){_onTaped(lst.items[index], index);});}, // Строка ~65. callBack.
            //         );
            //       }
            //     );
            //   return lV;
            // },
          ),
          Container(
            color: _navBarColor,
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // First bottom button
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  constraints: const BoxConstraints(minWidth: 63.0),
                  //fillColor: _buttonColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(_llBt)
                  ),
                  padding: const EdgeInsets.all(0.0),
                 // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                // Second bottom button
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  constraints: const BoxConstraints(minWidth: 63.0),
                  //fillColor: _buttonColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(_clBt)
                  ),
                  padding: const EdgeInsets.all(0.0),
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                // Third bottom button
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  constraints: const BoxConstraints(minWidth: 63.0),
                  //fillColor: _buttonColor,
                  child: ClipOval(
                    child: Image.asset(_ccBt)
                  ),
                  padding: const EdgeInsets.all(0.0),
                  shape: const CircleBorder(),
                ),
                // Fourth bottom button
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  constraints: const BoxConstraints(minWidth: 63.0),
                  //fillColor: _buttonColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(_crBt)
                  ),
                  padding: const EdgeInsets.all(0.0),
                ),
                // Fifth bottom button
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  constraints: const BoxConstraints(minWidth: 63.0),
                  //fillColor: _buttonColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(_rrBt)
                  ),
                  padding: const EdgeInsets.all(0.0),
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                )
              ]
            )
          )
        ],
      )
    );
  }

  /// Change color theme.
  void changeTheme(){
    if (pageTheme == ThemeEnum.light){
      pageTheme = ThemeEnum.dark;
      _navBarColor = navBarDarkColor;
      _mineFontColor = mineFontDarkColor;
      _backgroundColor = backgroundDarkColor;
      _listColor = listDarkColor;
      _backArrowBt = backArrowBtDark;
      _themeArrowBt = themeArrowBtDark;
      _numbersColor = numbersDarkColor;
      _listTextColor = listTextDarkColor;
      _llBt = llBtDark;
      _clBt = clBtDark;
      _ccBt = ccBtDark;
      _crBt = crBtDark;
      _rrBt = rrBtDark;
    } else {
      pageTheme = ThemeEnum.light;
      _navBarColor = navBarLightColor;
      _mineFontColor = mineFontLightColor;
      _backgroundColor = backgroundLightColor;
      _listColor = listLightColor;
      _backArrowBt = backArrowBtLight;
      _themeArrowBt = themeArrowBtLight;
      _numbersColor = numbersLightColor;
      _listTextColor = listTextLightColor;
      _llBt = llBtLight;
      _clBt = clBtLight;
      _ccBt = ccBtLight;
      _crBt = crBtLight;
      _rrBt = rrBtLight;
    }
  setState(() {});
  }
}

enum ThemeEnum{
  light,
  dark
}

/// Block of colors and paths const.
/// This is to avoid typos.
const String backArrowBtLight = 'images/back_arrow_bt_light.png';
const String backArrowBtDark = 'images/back_arrow_bt_dark.png';
const String themeArrowBtLight = 'images/theme_bt_light.png';
const String themeArrowBtDark = 'images/theme_bt_dark.png';
const String llBtLight = 'images/ll_bt_light.png';
const String llBtDark = 'images/ll_bt_dark.png';
const String clBtLight = 'images/cl_bt_light.png';
const String clBtDark = 'images/cl_bt_dark.png';
const String ccBtLight = 'images/cc_bt_light.png';
const String ccBtDark = 'images/cc_bt_dark.png';
const String crBtLight = 'images/cr_bt_light.png';
const String crBtDark = 'images/cr_bt_dark.png';
const String rrBtLight = 'images/rr_bt_light.png';
const String rrBtDark = 'images/rr_bt_dark.png';

const navBarLightColor = Color(0xFFEBF2F9);
const navBarDarkColor = Color(0xFF282A31);
const mineFontLightColor = Color(0xFF393939);
const mineFontDarkColor = Color(0xFFFFFFFF);
const backgroundLightColor = Color(0xFFE5E5E5);
const backgroundDarkColor = Color(0xFF2F313A);
const listLightColor = Color(0xFFFFFFFF);
const listDarkColor = Color(0xFF3A3C45);
const numbersLightColor = Color(0xFFEDA1B9);
const numbersDarkColor = Color(0xFFC1B8ED);
const listTextLightColor = Color(0xFF393939);
const listTextDarkColor = Color(0xFFFFFFFF);


const topButtonsLightColor1 = Color(0xFFFFFFFF);
const topButtonsLightColor2 = Color(0xFFE0ECFA);
const topButtonsDarkColor1 = Color(0xFF464851);
const topButtonsDarkColor2 = Color(0xFF282B33);



//FFFFFF
//#C1B8ED

//#393939
//#EDA1B9