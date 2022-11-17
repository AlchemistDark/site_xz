
import 'dart:core';

class UserData{
  final String username;
  final String region;
  final List<Celebrate> holidays;
  final List<String> peopleDates;
  final List<int> peopleCount;
  final String avatarImagePath;
  final String nextHoliday;
  final String nextHolidayName;
  final String nextHolidayIconPath;

  UserData({
    required this.username,
    required this.region,
    required this.holidays,
    required this.peopleDates,
    required this.peopleCount,
    required this.avatarImagePath,
    required this.nextHoliday,
    required this.nextHolidayName,
    required this.nextHolidayIconPath
  });
}

enum CelebrationCategory{family, friends, relatives, colleagues, partners}

class Celebrate{
  final int month;
  final int date;
  CelebrationCategory celebrationCategory;

  Celebrate(this.month, this.date, this.celebrationCategory);
}



final List<UserData> usersList = [
  UserData(
    username: 'Наталья Фадеева',
    region: 'г. Тула, Россия',
    holidays: [
      Celebrate(11, 4, CelebrationCategory.relatives),
      Celebrate(11, 7, CelebrationCategory.relatives),
      Celebrate(11, 15, CelebrationCategory.family),
      Celebrate(11, 27, CelebrationCategory.friends),
      Celebrate(12, 3, CelebrationCategory.friends),
      Celebrate(12, 13, CelebrationCategory.friends),
      Celebrate(12, 31, CelebrationCategory.family),
    ],
    peopleDates: ['31.12.2022', '27.11.2022', 'n/a', 'n/a', 'n/a'],
    peopleCount: [5, 15, 143, 27, 30],
    avatarImagePath: "assets/images/avatar.png",
    nextHoliday: '27.11.2022',
    nextHolidayName: 'День рождения',
    nextHolidayIconPath: 'assets/images/friends_group_icon.svg'
  ),
  UserData(
    username: 'Иван Астапов',
    region: 'г. Красноярск, Россия',
    holidays: [
      Celebrate(11, 4, CelebrationCategory.relatives),
      Celebrate(11, 7, CelebrationCategory.relatives),
      Celebrate(11, 25, CelebrationCategory.family),
      Celebrate(11, 28, CelebrationCategory.friends),
      Celebrate(12, 7, CelebrationCategory.friends),
      Celebrate(12, 14, CelebrationCategory.friends),
      Celebrate(12, 19, CelebrationCategory.friends),
      Celebrate(12, 31, CelebrationCategory.family),
    ],
    peopleDates: ['25.11.2022', '28.11.2022', 'n/a', 'n/a', 'n/a'],
    peopleCount: [15, 40, 54, 47, 73],
    avatarImagePath: "assets/images/avatar1.jpg",
    nextHoliday: '25.11.2022',
    nextHolidayName: 'Годовщина',
    nextHolidayIconPath: 'assets/images/family_group_icon.svg'
  ),
  UserData(
    username: 'Ирина Иванова',
    region: 'г. Москва, Россия',
    holidays: [
      Celebrate(11, 15, CelebrationCategory.family),
      Celebrate(11, 20, CelebrationCategory.friends),
      Celebrate(11, 29, CelebrationCategory.friends),
      Celebrate(11, 30, CelebrationCategory.colleagues),
      Celebrate(12, 7, CelebrationCategory.colleagues),
      Celebrate(12, 15, CelebrationCategory.friends),
      Celebrate(12, 24, CelebrationCategory.family),
      Celebrate(12, 31, CelebrationCategory.family),
    ],
    peopleDates: ['24.12.2022', '20.11.2022', 'n/a', '30.11.2022', 'n/a'],
    peopleCount: [10, 20, 37, 41, 0],
    avatarImagePath: "assets/images/avatar2.jpg",
    nextHoliday: '20.11.2022',
    nextHolidayName: 'День рождения',
    nextHolidayIconPath: 'assets/images/friends_group_icon.svg'
  ),
];
