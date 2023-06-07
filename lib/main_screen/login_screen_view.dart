import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:site_xz/custom_icons.dart';
import 'package:http/http.dart' as http;

// import 'global/app_controller.dart';
// import 'global/planner_app_bar.dart';

class AddContactScreen extends StatefulWidget {

  final String token;
  // final AppController appController;


  const AddContactScreen(
    this.token,
    // this.appController,
    {Key? key}
  ) : super(key: key);

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  // "name": "юрик",
  // "person_photo": " ",
  // "birthday": "1999-12-22",
  // "sex": "0",
  // "phoneNumber": "+79998887766",
  // "telegram": "f@f",
  // "email": "ff@ff.ff",
  // "region": "teerrt",
  // "status": "1",
  // "cat": "1"

  String name = "Имя";
  String date = '1999-12-22';
  String phone = '+79999999999';
  String telegram = "Telegr@m";
  String city = "Город";
  String sex = "1";
  String status = "1";
  String cat = "1";

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
            SizedBox(
              height: kToolbarHeight,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(padding: EdgeInsets.only(top: 0.027*MediaQuery.of(context).size.height)),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Text(
                    'Имя',
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
              child: Row(
                children: [
                  Container(
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
                          hintText: 'Введите имя участника',
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
                  Padding(padding: EdgeInsets.only(left: 0.03*MediaQuery.of(context).size.width)),
                  Container(
                    alignment: Alignment.center,
                    height: 0.042*MediaQuery.of(context).size.height,
                    width: 0.042*MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(221, 232, 245, 1),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 0.02*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(166, 173, 181, 1),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 0.011*MediaQuery.of(context).size.width)),
                  Container(
                    height: 0.042*MediaQuery.of(context).size.height,
                    width: 0.042*MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(221, 232, 245, 1),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 0.02*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(166, 173, 181, 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Text(
                    'Дата рождения',
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
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.only(right: 0.16*MediaQuery.of(context).size.width),
                    child: Text(
                      'Пол',
                      style: TextStyle(
                        fontSize: 0.017*MediaQuery.of(context).size.height,
                        color: const Color.fromRGBO(65, 78, 88, 1),
                        fontFamily: 'Roboto400'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.06*MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        onChanged: (text){date = text;},
                        cursorColor: const Color.fromRGBO(244, 199, 217,1),
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(
                          color: const Color.fromRGBO(244, 199, 217,1),
                          fontSize: 0.017*MediaQuery.of(context).size.height,
                          fontFamily: 'Roboto400'
                        ),
                        decoration: InputDecoration(
                          hintText: 'дд/мм/гг',
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
                  Container(
                    height: 0.06*MediaQuery.of(context).size.height,
                    width: 0.192*MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(250, 255, 255, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 1.5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          value: sex,
                          items: const [
                            DropdownMenuItem(
                              child: Text("Ж"),
                              value: "0"
                            ),
                            DropdownMenuItem(
                              child: Text("М"),
                              value: "1",
                            )
                          ],
                          hint: const Text("Ж"),
                          onChanged: (value){
                            setState(() {
                              sex = value!;
                              print(sex);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
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
                ],
              ),
            ),
            Container(
              height: 0.06*MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 255, 255, 1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 1.5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.042*MediaQuery.of(context).size.width),
                    child: SizedBox(
                      height:0.06*MediaQuery.of(context).size.height ,
                      width: 0.9*MediaQuery.of(context).size.width - 0.05*MediaQuery.of(context).size.height-0.042*MediaQuery.of(context).size.width,
                      child: TextField(
                        onChanged: (text){phone = "+7 $text";},
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(
                          color: const Color.fromRGBO(65, 78, 88, 1),
                          fontSize: 0.017*MediaQuery.of(context).size.height,
                          fontFamily: 'Roboto400'
                        ),
                        cursorColor: const Color.fromRGBO(65, 78, 88, 1),
                        decoration: InputDecoration(
                          prefixText: '+7',
                          hintText: '+7 ___ ___ __ __',
                          hintStyle: TextStyle(
                            color: const Color.fromRGBO(166, 173, 181,1),
                            fontSize: 0.019*MediaQuery.of(context).size.height,
                            fontFamily: 'Roboto400'
                          ),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 0.06  *MediaQuery.of(context).size.height,
                    width: 0.06*MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient:const LinearGradient(
                        colors:[
                          Color.fromRGBO(255, 255, 255, 1),
                          Color.fromRGBO(234, 246, 255, 1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 0),
                    ),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds){
                        return const LinearGradient(
                          colors: [
                            Color.fromRGBO( 98, 198, 170, 1),
                            Color.fromRGBO(68, 168, 140, 1)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        ).createShader(bounds);
                      },
                      child: const Icon(
                        Icons.phone_in_talk,
                        color: Color(0xFF52B69A),
                      )
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Text(
                    'Telegram',
                    style: TextStyle(
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(65, 78, 88, 1),
                      fontFamily: 'Roboto400'
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.06*MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 255, 255, 1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 1.5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0.042*MediaQuery.of(context).size.width),
                    child: SizedBox(
                      height:0.06*MediaQuery.of(context).size.height ,
                      width: 0.9*MediaQuery.of(context).size.width - 0.05*MediaQuery.of(context).size.height-0.042*MediaQuery.of(context).size.width,
                      child: TextField(
                        onChanged: (text){telegram = text;},
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(
                          color: const Color.fromRGBO(65, 78, 88, 1),
                          fontSize: 0.017*MediaQuery.of(context).size.height,
                          fontFamily: 'Roboto400'
                        ),
                        cursorColor: const Color.fromRGBO(65, 78, 88, 1),
                        decoration: InputDecoration(
                          hintText: 'Telegram',
                          hintStyle: TextStyle(
                            color: const Color.fromRGBO(166, 173, 181,1),
                            fontSize: 0.019*MediaQuery.of(context).size.height,
                            fontFamily: 'Roboto400'
                          ),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 0.06  *MediaQuery.of(context).size.height,
                    width: 0.06*MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient:const LinearGradient(
                        colors:[
                          Color.fromRGBO(255, 255, 255, 1),
                          Color.fromRGBO(234, 246, 255, 1),
                        ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),
                        width: 0
                      ),
                    ),
                    child: Icon(
                      CustomIcons.telegram,
                      size: 0.04*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(68, 180, 240, 1),
                    )
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Text(
                    'Город',
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
              child: Row(
                children: [
                  Container(
                    height: 0.06*MediaQuery.of(context).size.height,
                    width: 0.93*MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(250, 255, 255, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 1.5)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.042*MediaQuery.of(context).size.width),
                      child: TextField(
                        onChanged: (text){city = text;},
                        cursorColor: const Color.fromRGBO(244, 199, 217,1),
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(
                          color: const Color.fromRGBO(244, 199, 217,1),
                          fontSize: 0.017*MediaQuery.of(context).size.height,
                          fontFamily: 'Roboto400'
                        ),
                        decoration: InputDecoration(
                          hintText: 'Выберите город',
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
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Text(
                    'Статус отношений',
                    style: TextStyle(
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(65, 78, 88, 1),
                      fontFamily: 'Roboto400'
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.06*MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 255, 255, 1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 1.5)
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 0.042*MediaQuery.of(context).size.width),
                child: DropdownButton<String>(
                  value: status,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Семья"),
                      value: "1"
                    ),
                    DropdownMenuItem(
                      child: Text("Друзья"),
                      value: "2",
                    ),
                    DropdownMenuItem(
                      child: Text("Близкие"),
                      value: "3",
                    ),
                    DropdownMenuItem(
                      child: Text("Коллеги"),
                      value: "4",
                    ),
                    DropdownMenuItem(
                      child: Text("Партнёры"),
                      value: "5",
                    )
                  ],
                  hint: const Text("Выберите статус отношений"),
                  onChanged: (value){
                    setState(() {
                      status = value!;
                      print(status);
                    });
                  },
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
            Padding(
              padding: EdgeInsets.only(left: 0.048*MediaQuery.of(context).size.width),
              child: Row(
                children: [
                  Text(
                    'Принадлежность к автономной группе',
                    style: TextStyle(
                      fontSize: 0.017*MediaQuery.of(context).size.height,
                      color: const Color.fromRGBO(65, 78, 88, 1),
                      fontFamily: 'Roboto400'
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.06*MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 255, 255, 1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color.fromRGBO(230, 241, 254, 1),width: 1.5)
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 0.042*MediaQuery.of(context).size.width),
                child: DropdownButton<String>(
                  value: cat,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Семья"),
                      value: "1"
                    ),
                    DropdownMenuItem(
                      child: Text("Друзья"),
                      value: "2",
                    ),
                    DropdownMenuItem(
                      child: Text("Близкие"),
                      value: "3",
                    ),
                    DropdownMenuItem(
                      child: Text("Коллеги"),
                      value: "4",
                    ),
                    DropdownMenuItem(
                      child: Text("Партнёры"),
                      value: "5",
                    )
                  ],
                  hint: const Text("Выберите группу или создайте новую'"),
                  onChanged: (value){
                    setState(() {
                      cat = value!;
                      print(cat);
                    });
                  },
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
            SizedBox(
              height: 0.06*MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 0.06*MediaQuery.of(context).size.height,
                    width: 0.06*MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(166, 173, 181, 1),
                        width: 2
                      )
                    ),
                    child: SizedBox(
                      height: 0.026*MediaQuery.of(context).size.height,
                      width: 0.026*MediaQuery.of(context).size.height,
                      // child: SvgPicture.asset(
                      //   'assets/svg/add_photo.svg',
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 0.06*MediaQuery.of(context).size.height,
                    width: 0.73*MediaQuery.of(context).size.width,
                    child: Container(
                        // height: 62,
                        // width : widget.mainWidth - 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1F2F5),
                          border: Border.all(
                            color: const Color(0xFF53B79B),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(13)
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: AddButton(
                                  onPressed: (){},
                                )
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Загрузить фото",
                                style: TextStyle(
                                  color: Color(0xFF393939),
                                  fontSize: 14,
                                  fontFamily: 'Roboto'
                                )
                              )
                            ],
                          )
                        )
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 0.015*MediaQuery.of(context).size.height)),
            SizedBox(
              height: 0.056 * MediaQuery.of(context).size.height,
              width: 0.93*MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     widget.appController.contactCreate(
                  //       widget.token,
                  //       name,
                  //       date,
                  //       phone,
                  //       telegram,
                  //       city,
                  //       sex,
                  //       status,
                  //       cat,
                  //     );
                  //     Navigator.of(context).pop();
                  //   },
                  //   child: Container(
                  //     width: 0.44 * MediaQuery.of(context).size.width,
                  //     height: 0.056 * MediaQuery.of(context).size.height,
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //       gradient: const LinearGradient(
                  //         colors: [
                  //           Color.fromRGBO(98, 198, 170, 1),
                  //           Color.fromRGBO(68, 168, 140, 1)
                  //         ],
                  //         begin: Alignment.centerLeft,
                  //         end: Alignment.centerRight,
                  //       ),
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     child: const Text(
                  //       'Сохранить',
                  //       style: TextStyle(
                  //         fontFamily: 'Roboto600', fontSize: 14, color: Colors.white
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 0.44 * MediaQuery.of(context).size.width,
                      height: 0.056 * MediaQuery.of(context).size.height,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(194, 196, 204, 1),
                            Color.fromRGBO(160, 165, 181, 1)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Праздники контакта',
                        style: TextStyle(
                          fontFamily: 'Roboto600', fontSize: 14, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  final Icon icon = const Icon(
    Icons.add,
    color: Colors.white,
  );
  final Function onPressed;

  const AddButton({
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color green = const Color(0xFF52B69A);

    return Listener(
        child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: green,
                boxShadow: [
                  BoxShadow(
                    color: isPressed? green : green,
                    blurRadius: isPressed? 5 : 0,
                    spreadRadius: 0,
                  )
                ]
            ),
            child: widget.icon
        ),
        onPointerDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        onPointerUp: (_) {
          setState(() {
            isPressed = false;
          });
          widget.onPressed();
        }
    );
  }
}
