import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:site_xz/custom_icons.dart';
import 'package:http/http.dart' as http;
import 'package:site_xz/mok2.dart';

import 'global/app_controller.dart';
import 'global/person_class.dart';
import 'global/planner_app_bar.dart';
import 'global/provider.dart';
import 'main_screen/planner_main_screen_view.dart';

class LoginScreen extends StatefulWidget {

  final String title;
  final double mainWidth;

  const LoginScreen(
    this.title,
    this.mainWidth,
    {Key? key}
  ) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String name = "NatalyaBloom";
  String pass = "NatalyaPass";

  Future<void> login() async{
    final Provider provider = Provider.withName(name, pass);
    await Future.delayed(const Duration(seconds: 5), () {
      print(provider.authState.isAuthSuccess);
    });
    final String token = provider.authState.token;
    print(token);
    await provider.postRequest(token);
    await provider.contactListRequest(token);
    List<Contact> contactList = provider.contactList;

    String responseAnswer = utf8.decode(provider.postResponse.response.bodyBytes);
    final Person person = Person.fromJson(jsonDecode(responseAnswer));
    print('праздников пришло ${person.celebrates.length}');
    print("${person.celebrates[0].id}, ${person.celebrates[0].day} ${person.celebrates[0].month} ${person.celebrates[0].date}");
    print("${person.celebrates[0].name}, ${person.celebrates[0].icon} ${person.celebrates[0].peopleCategory} ${person.celebrates[0].celebrateCategory}");
    AppController appController = AppController(person, contactList);
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) {
          return MainPlannerScreen(widget.title, widget.mainWidth, appController, token);
          // return MokScreen(widget.title, widget.mainWidth, appController, token);
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(240, 247, 254, 1),
      // appBar: PlannerAppBar(
      //   callBack: (){Navigator.pop(context);},
      //   controller: widget.appController,
      //   child: Container(
      //     alignment: Alignment.center,
      //     child: const Text(
      //       "Контактные данные",
      //       style: TextStyle(
      //         color: Color(0xFF161A1D),
      //         fontSize: 17,
      //         fontFamily: 'Roboto'
      //       ),
      //     ),
      //   )
      // ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 10,
              ),
            ),
            Center(
              child: SizedBox(
                width: 217,
                height: 57,
                child: Image.asset(
                  "assets/images/login_logo_light.png",
                  scale: 0.5,
                  fit: BoxFit.contain
                )
              )
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 10,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Text(
                    'Номер телефона',
                    style: TextStyle(
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(65, 78, 88, 1),
                      fontFamily: 'Roboto400'
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      color: Colors.red,
                      fontFamily: 'Roboto400'
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 0.06*MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              child: Container(
                height: 0.06*MediaQuery.of(context).size.height,
                width: 0.7*MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 255, 255, 1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 1.5)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 0.042*MediaQuery.of(context).size.width),
                  child: TextField(
                    onChanged: (text){name = text;},
                    cursorColor: const Color.fromRGBO(244, 199, 217,1),
                    textAlignVertical: TextAlignVertical.top,
                    style: TextStyle(
                      color: const Color.fromRGBO(244, 199, 217,1),
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      fontFamily: 'Roboto400'
                    ),
                    decoration: InputDecoration(
                      hintText: 'Введите Ваш номер телефона',
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(166, 173, 181,1),
                        fontSize: 0.017*MediaQuery.of(context).size.height,
                        fontFamily: 'Roboto400'
                      ),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Text(
                    'Пароль',
                    style: TextStyle(
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(65, 78, 88, 1),
                      fontFamily: 'Roboto400'
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      color: Colors.red,
                      fontFamily: 'Roboto400'
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 0.06*MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              child: Container(
                height: 0.06*MediaQuery.of(context).size.height,
                width: 0.7*MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 255, 255, 1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 1.5)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 0.042*MediaQuery.of(context).size.width),
                  child: TextField(
                    // obscureText: true,
                    onChanged: (text){pass = text;},
                    cursorColor: const Color.fromRGBO(244, 199, 217,1),
                    textAlignVertical: TextAlignVertical.top,
                    style: TextStyle(
                      color: const Color.fromRGBO(244, 199, 217,1),
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      fontFamily: 'Roboto400'
                    ),
                    decoration: InputDecoration(
                      hintText: 'Введите Ваш пароль',
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(166, 173, 181,1),
                        fontSize: 0.017*MediaQuery.of(context).size.height,
                        fontFamily: 'Roboto400'
                      ),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
            SizedBox(
              height: 0.056 * MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {login();},
                child: Container(
                  width: 0.44 * MediaQuery.of(context).size.width,
                  height: 0.056 * MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(98, 198, 170, 1),
                        Color.fromRGBO(68, 168, 140, 1)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      fontFamily: 'Roboto600', fontSize: 14, color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'У вас еще нет учетной записи?  ',
                    style: TextStyle(
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(65, 78, 88, 1),
                      fontFamily: 'Roboto400'
                    ),
                  ),
                  Text(
                    'РЕГИСТРАЦИЯ',
                    style: TextStyle(
                        fontSize: 0.017*MediaQuery.of(context).size.height,
                        color: Colors.blue,
                        fontFamily: 'Roboto400'
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
