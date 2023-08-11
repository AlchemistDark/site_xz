import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:site_xz/detail_contact_screen_view.dart';

import 'package:site_xz/global/app_controller.dart';
import 'package:site_xz/global/buttons.dart';
import 'package:site_xz/global/person_class.dart';
import 'package:site_xz/global/planner_app_bar.dart';
import 'package:site_xz/global/theme.dart';
import 'package:site_xz/contact_line_widget.dart';
import 'package:site_xz/add_contact_screen_view.dart';
import 'package:site_xz/edit_contact_screen_view.dart';

///

class ContactListScreen extends StatefulWidget {
  static const route = '/contact';

  final String title;
  final double mainWidth;
  final AppController appController;
  final String token;

  const ContactListScreen(
    this.title,
    this.mainWidth,
    this.appController,
    this.token,
    {Key? key}
  ) : super(key: key);

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();

}

class _ContactListScreenState extends State<ContactListScreen> {

  final ScrollController _scrollController = ScrollController();

  _ContactListScreenState();

  // Future<void> getUserList(String token) async {
  //   http.Response postR = await http.post(
  //       Uri.https('qviz.fun', 'api/v1/peoplelist/'),
  //       headers: {"Authorization": 'Token $token'}
  //   );
  //
  //   final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
  //   // height = json["sensor"] as double;
  //   // distance = json["distance"] as double;
  //   // if (((distance < lowerLimit) || (height < lowerLimit))
  //   //     || ((distance > upperLimit) || (height > upperLimit))){
  //   //   pauseTimer = 3;
  //   //   eyeTrackerState = EyeTrackerState(
  //   //       frameNumber: frameNumber,
  //   //       pauseTimer: pauseTimer,
  //   //       isAppStop: isAppStop
  //   //   );
  //   //   eyeTrackerCtrl.add(eyeTrackerState);
  //   // }
  //   print(json);
  // }

  // Future<void> userCreate(String token) async {
  //   final body = {
  //   "name": "юрик",
  //   "person_photo": " ",
  //   "birthday": "1999-12-22",
  //   "sex": "0",
  //   "phoneNumber": "+79998887766",
  //   "telegram": "f@f",
  //   "email": "ff@ff.ff",
  //   "region": "teerrt",
  //   "status": "1",
  //   "cat": "1"
  //   };
  //   http.Response postR = await http.post(
  //       Uri.https('qviz.fun', 'api/v1/people/'),
  //       headers: {"Authorization": 'Token $token'},
  //       body: body
  //   );
  //
  //   final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
  //   // height = json["sensor"] as double;
  //   // distance = json["distance"] as double;
  //   // if (((distance < lowerLimit) || (height < lowerLimit))
  //   //     || ((distance > upperLimit) || (height > upperLimit))){
  //   //   pauseTimer = 3;
  //   //   eyeTrackerState = EyeTrackerState(
  //   //       frameNumber: frameNumber,
  //   //       pauseTimer: pauseTimer,
  //   //       isAppStop: isAppStop
  //   //   );
  //   //   eyeTrackerCtrl.add(eyeTrackerState);
  //   // }
  //   print(json);
  // }
  //
  // Future<void> userUpdate(String token) async {
  //   final body = {
  //        "name": "юлик",
  //     // "person_photo": " ",
  //        "birthday": "1990-12-22",
  //        "sex": "1",
  //     // "phoneNumber": "+79998887766",
  //        "password": "qweqwrq",
  //        "telegram": "u@u",
  //        "email": "uu@uu.uu",
  //        "region": "tuuuuurt",
  //
  //     // "status": "2",
  //     // "cat": "2"
  //   };
  //   http.Response postR = await http.put(
  //       Uri.https('qviz.fun', 'api/v1/people/14/'), // слэш в конце обязятельно!
  //       headers: {"Authorization": 'Token $token'},
  //       body: body
  //   );
  //   print(postR.statusCode);
  //
  //   // final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
  //   // height = json["sensor"] as double;
  //   // distance = json["distance"] as double;
  //   // if (((distance < lowerLimit) || (height < lowerLimit))
  //   //     || ((distance > upperLimit) || (height > upperLimit))){
  //   //   pauseTimer = 3;
  //   //   eyeTrackerState = EyeTrackerState(
  //   //       frameNumber: frameNumber,
  //   //       pauseTimer: pauseTimer,
  //   //       isAppStop: isAppStop
  //   //   );
  //   //   eyeTrackerCtrl.add(eyeTrackerState);
  //   // }
  // }
  //
  // Future<void> userDelete(String token) async {
  //
  //   http.Response postR = await http.delete(
  //       Uri.https('qviz.fun', 'api/v1/people/17'),
  //       headers: {"Authorization": 'Token $token'},
  //   );
  //   print(postR.statusCode);
  //
  //   // final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
  //   // height = json["sensor"] as double;
  //   // distance = json["distance"] as double;
  //   // if (((distance < lowerLimit) || (height < lowerLimit))
  //   //     || ((distance > upperLimit) || (height > upperLimit))){
  //   //   pauseTimer = 3;
  //   //   eyeTrackerState = EyeTrackerState(
  //   //       frameNumber: frameNumber,
  //   //       pauseTimer: pauseTimer,
  //   //       isAppStop: isAppStop
  //   //   );
  //   //   eyeTrackerCtrl.add(eyeTrackerState);
  //   // }
  //
  // }

  void contactCreate() {
    setState(() {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) {
            return AddContactScreen(
              widget.token,
              // widget.title,
              // widget.mainWidth,
              widget.appController,
            );
          }
        )
      );
    });
  }
  void contactUpdate(Contact contact) {
    setState(() {
      Navigator.push(
        context, MaterialPageRoute(
        builder: (context) {
          return EditContactScreen(
            token: widget.token,
            appController: widget.appController,
            id: contact.id,
            name: contact.name,
            date: contact.birthday,
            phone: contact.phone,
            telegram: contact.telegram,
            city: contact.region,
            sex: "${contact.sex}",
            status: "${contact.status}",
            cat: "${contact.cat}",
            // widget.title,
            // widget.mainWidth,
          );
        }
      )
    );});
  }
  void contactDetails(Contact contact) {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(
          builder: (context) {
            return DetailContactScreen(
              token: widget.token,
              appController: widget.appController,
              id: contact.id,
              name: contact.name,
              date: contact.birthday,
              phone: contact.phone,
              telegram: contact.telegram,
              city: contact.region,
              sex: "${contact.sex}",
              status: "${contact.status}",
              cat: "${contact.cat}",
              // widget.title,
              // widget.mainWidth,
            );
          }
      )
      );});
  }

  Future<void> contactDelete(int id)async {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Предупреждение!"),
        content: Text("Вы действительно хотите удалить $id из списка контактов?"),
        actions: [
          ElevatedButton(
            onPressed: () async {
              widget.appController.contactDelete(id, widget.token);
              Navigator.of(context).pop();
            },
            child: const Text("Удалить")),
          ElevatedButton(
            onPressed: (){Navigator.of(context).pop();},
            child: const Text("Отмена")),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
      initialData: widget.appController.currentAppState,
      stream: widget.appController.state,
      builder: (context, snapshot) {
        AppTheme theme = snapshot.data!.theme;
        Person person = snapshot.data!.userData;

        /// Если исрользовать для блоков Separator line исполльзовать Expanded,
        /// как сделал в начале, то NavBar при открытии бужет уменьшать их
        /// высоту и вёрстка поедет. Поэтому я использовал Container,
        /// высота которого расчитывается один раз на всё время
        /// по формуле ниже и сохраняется в переменную [separatorHeight].
        /// Вся доступная высота экрана - (Высота Contact avatar line
        ///
        ///   + Высота Groups line + Поле под NavBar(максимум было 160, сейчас 10)))
        ///   / Число блоков Separator line;
        double separatorHeight
            = (MediaQuery.of(context).size.height - (72 + 90 + 50 + 270 + 62 + 50)) / 4;

        separatorHeight = (separatorHeight < 0)? 0 : separatorHeight;

        return Scaffold(
          appBar: PlannerAppBar(
            callBack: (){Navigator.pop(context);},
            controller: widget.appController,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Список контактов",
                style: TextStyle(
                  color: theme.appBarTextColor,
                  fontSize: 17,
                  fontFamily: 'Roboto'
                ),
              ),
            )
          ),
          body: Container(
            color: theme.mainColor,
            child: Column(
              children: <Widget>[
                /// Separator line.
                SizedBox(
                  height: separatorHeight,
                  width: 10,
                ),
                /// Contact avatar line.
                Container(
                  height: 72,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  color: theme.mainColor,
                  child: Row(
                    children: [
                      /// Avatar.
                      SizedBox(
                          height: 54,
                          width: 54,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(27),
                            child: Image.asset(
                              // ToDo Аватар должен браться с сервера
                              "assets/images/avatar.png",//avatarImagePath = usersList[userNumber].avatarImagePath,
                              fit:BoxFit.fitHeight,
                            )
                          )
                        ),
                      /// Name and address.
                      Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 8, top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  person.userName,
                                  style: TextStyle(
                                    color: theme.avatarText1Color,
                                    fontSize: 16,
                                    fontFamily: 'Roboto'
                                  ),
                                ),
                                Text(
                                  person.region,
                                  style: TextStyle(
                                    color: theme.avatarText2Color,
                                    fontSize: 14,
                                    fontFamily: 'Roboto'
                                  ),
                                )
                              ]
                            )
                          )
                        ),
                    ]
                  )
                ),
                /// Separator line.
                SizedBox(
                  height: separatorHeight,
                  width: 10,
                ),
                /// Groups line.
                Container(
                  width: widget.mainWidth,
                  height: 90,
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      /// Family group button.
                      MyGroupButton(
                        isPressed: false,//selectedGroups[0],
                        theme: theme,
                        callback: (){},
                        // (){setState(() {
                        //   selectedGroups[0] = !selectedGroups[0];
                        // });},
                        buttonColor: theme.defaultGroupButtonColor,
                        iconPath: 'assets/images/family_group_icon.svg', // ToDo
                        count: person.peopleCount[0].toString(),
                        buttonName: 'Семья',
                        date: person.peopleDates[0][0],
                      ),
                      /// Separator.
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 90,
                        ),
                      ),
                      /// Friends group button.
                      MyGroupButton(
                        isPressed: false,//selectedGroups[1],
                        theme: theme,
                        callback: (){},
                        // (){setState(() {
                        //   selectedGroups[0] = !selectedGroups[0];
                        // });},
                        buttonColor: theme.defaultGroupButtonColor,
                        iconPath: 'assets/images/friends_group_icon.svg', // ToDo
                        count: person.peopleCount[1].toString(),
                        buttonName: 'Друзья',
                        date: person.peopleDates[1][0],
                      ),
                      /// Separator.
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 90,
                        ),
                      ),
                      /// Relatives group button.
                      MyGroupButton(
                        isPressed: false,//selectedGroups[2],
                        theme: theme,
                        callback: (){},
                        // (){setState(() {
                        //   selectedGroups[0] = !selectedGroups[0];
                        // });},
                        buttonColor: theme.defaultGroupButtonColor,
                        iconPath: 'assets/images/relatives_group_icon.svg', // ToDo
                        count: person.peopleCount[2].toString(),
                        buttonName: 'Близкие',
                        date: person.peopleDates[2][0],
                      ),
                      /// Separator.
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 90,
                        ),
                      ),
                      /// Colleagues group button.
                      MyGroupButton(
                        isPressed: false,//selectedGroups[3],
                        theme: theme,
                        callback: (){},
                        // (){setState(() {
                        //   selectedGroups[0] = !selectedGroups[0];
                        // });},
                        buttonColor: theme.defaultGroupButtonColor,
                        iconPath: 'assets/images/colleagues_group_icon.svg', // ToDo
                        count: person.peopleCount[3].toString(),
                        buttonName: 'Коллеги',
                        date: person.peopleDates[3][0],
                      ),
                        /// Separator.
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 90,
                          ),
                        ),
                        /// Partners group button.
                        MyGroupButton(
                          isPressed: false,//selectedGroups[4],
                          theme: theme,
                          callback: (){},
                          // (){setState(() {
                          //   selectedGroups[0] = !selectedGroups[0];
                          // });},
                          buttonColor: theme.defaultGroupButtonColor,
                          iconPath: 'assets/images/partners_group_icon.svg', // ToDo
                          count: person.peopleCount[4].toString(),
                          buttonName: 'Партнёры',
                          date:person.peopleDates[4][0],
                        )
                      ]
                    )
                  ),
                /// Separator line.
                SizedBox(
                  height: separatorHeight,
                  width: 10,
                ),
                /// ContactList.
                SizedBox(
                  height: 270,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.appController.contactList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ContactListWidget(
                          theme: theme,
                          contact: widget.appController.contactList[index],
                          callBackDelete: (){
                            setState(() {
                              contactDelete(
                                widget.appController.contactList[index].id
                              );
                            });
                          },
                          callBackUpdate: () {
                            setState(() {
                              contactUpdate(
                                widget.appController.contactList[index]
                              );
                            });
                          },
                          callBackDetails: () {
                            setState(() {
                              contactDetails(
                                  widget.appController.contactList[index]
                              );
                            });
                          },
                        );
                      }
                    )
                  )
                ),
                /// Separator line.
                SizedBox(
                  height: separatorHeight,
                  width: 10,
                ),
                Container(
                  height: 62,
                  width : widget.mainWidth - 32,
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
                            onPressed: (){contactCreate();},
                          )
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Добавить контакт",
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
                  /// navBar. // ToDo
                  // Lets use docked FAB for handling state of sheet

                  // bottomNavigationBar:
                  // BottomExpandableAppBar(
                  //   horizontalMargin: 16,
                  //   expandedBackColor: Theme.of(context).backgroundColor,
                  //     expandedBody: const Center(
                  //       child: Text("Hello world!"),
                  //     ),
                  //   )
                ]
            ),
            //     Container(
            //       width: widget.mainWidth,
            //       padding: const EdgeInsets.all(0.0),
            //       margin: const EdgeInsets.all(0.0),
            //       color: theme.appBarColor,
            //       child: Row(
            //         children: [
            //           /// Separator.
            //           Expanded(
            //             flex: 1,
            //             child: Container(),
            //           ),
            //           /// First nav button.
            //           MyNavBarButton(
            //             theme: theme,
            //             callback: (){},
            //             iconPath: 'assets/images/1.1.svg', // ToDo
            //             iconColor: theme.mainGreenColor,
            //           ),
            //           /// Separator.
            //           Expanded(
            //             flex: 1,
            //             child: Container(),
            //           ),
            //           /// Second nav button.
            //           MyNavBarButton(
            //             theme: theme,
            //             callback: (){},
            //             iconPath: 'assets/images/1.2.svg', // ToDo
            //             iconColor: theme.celebrateTextColor // ToDo
            //           ),
            //           /// Separator.
            //           Expanded(
            //             flex: 1,
            //             child: Container(),
            //           ),
            //           /// Central nav button. // ToDo
            //           CentralNavBarButton(
            //             theme: theme,
            //             callback: (){},
            //             iconPath: 'assets/images/1.3.svg', // ToDo
            //             iconColor: theme.celebrateTextColor // ToDo
            //           ),
            //           /// Separator.
            //           Expanded(
            //             flex: 1,
            //             child: Container(),
            //           ),
            //           /// Fourth nav button.
            //           MyNavBarButton(
            //             theme: theme,
            //             callback: (){},
            //             iconPath: 'assets/images/1.4.svg', // ToDo
            //             iconColor: theme.celebrateTextColor // ToDo
            //           ),
            //           /// Separator.
            //           Expanded(
            //             flex: 1,
            //             child: Container(),
            //           ),
            //           /// Fifth nav button.
            //           MyNavBarButton(
            //             theme: theme,
            //             callback: (){},
            //             iconPath: 'assets/images/1.5.svg', // ToDo
            //             iconColor: theme.celebrateTextColor // ToDo
            //           ),
            //           /// Separator.
            //           Expanded(
            //             flex: 1,
            //             child: Container(),
            //           )
            //         ]
            //     )
            // ),
          )

            // child: Column(
            //   children: <Widget>[
            //     // Expanded(
            //     //   flex: 1,
            //     //   child: Container()
            //     // ),
            //     /// navBar. // ToDo
            //     Container(
            //       height: 46,
            //       padding: const EdgeInsets.all(0.0),
            //       margin: const EdgeInsets.all(0.0),
            //       color: appBarDarkColor,
            //       child:
            //         Row(
            //           children: [
            //             // Вывести список
            //             GradientAnimatedButtonWithGreenIcon(
            //                 theme: theme,
            //                 iconPath: addButtonIcon,
            //                 onPressed: (){
            //                   getUserList(widget.token);
            //                 }//10. При нажатии "Добавить контакт" идём на экран 2.6 - Экран "Мой список контактов"
            //            ),
            //
            //             GradientAnimatedButtonWithGreenIcon(
            //                 theme: theme,
            //                 iconPath: addButtonIcon,
            //                 onPressed: (){
            //                   userCreate(widget.token);
            //                 }//10. При нажатии "Добавить контакт" идём на экран 2.6 - Экран "Мой список контактов"
            //            ),
            //             GradientAnimatedButtonWithGreenIcon(
            //                 theme: theme,
            //                 iconPath: addButtonIcon,
            //                 onPressed: (){
            //                   userUpdate(widget.token);
            //                 }//10. При нажатии "Добавить контакт" идём на экран 2.6 - Экран "Мой список контактов"
            //             ),
            //             GradientAnimatedButtonWithGreenIcon(
            //                 theme: theme,
            //                 iconPath: addButtonIcon,
            //                 onPressed: (){
            //                   userDelete(widget.token);
            //                 }//10. При нажатии "Добавить контакт" идём на экран 2.6 - Экран "Мой список контактов"
            //             )
            //           ],
            //         )
            //
            //       // Row(
            //       //   children: const [
            //       //     Text('Здесь будет navBar') // ToDo
            //       //     //  FloatingActionButton(
            //       //     //    onPressed: () => {},
            //       //     //    foregroundColor: Color(0xFF00FF00),
            //       //     //    backgroundColor: Color(0xFFFFFF00),
            //       //     //    //hoverColor: Color(0xFFFF0000),
            //       //     //    elevation: 5.0,
            //       //     //      child:
            //       //     //      (const Icon(
            //       //     //        Icons.arrow_back_ios_new,
            //       //     //        color: Color(0xFFBBBBBB),
            //       //     //      ))
            //       //     //  ),
            //       //     //  RawMaterialButton(
            //       //     //    onPressed: () {},
            //       //     //    elevation: 2.0,
            //       //     //    child: const Icon(
            //       //     //      Icons.wb_sunny_outlined,
            //       //     //      color: appBarDarkColor,
            //       //     //    )
            //       //     // ),
            //       //     // padding: const EdgeInsets.all(0.0),
            //       //   ]
            //       // )
            //     ),
            //   ]
            // )
          // )
        );
      }
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