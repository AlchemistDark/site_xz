
import 'dart:core';

class UserData{
  final String username;
  final String region;
  final List<Celebration> holidays;
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

class Celebration{
  final int month;
  final int date;
  CelebrationCategory celebrationCategory;

  Celebration(this.month, this.date, this.celebrationCategory);
}



final List<UserData> usersList = [
  UserData(
    username: 'Наталья Фадеева',
    region: 'г. Тула, Россия',
    holidays: [
      Celebration(11, 4, CelebrationCategory.relatives),
      Celebration(11, 7, CelebrationCategory.relatives),
      Celebration(11, 15, CelebrationCategory.family),
      Celebration(11, 27, CelebrationCategory.friends),
      Celebration(12, 3, CelebrationCategory.friends),
      Celebration(12, 13, CelebrationCategory.friends),
      Celebration(12, 31, CelebrationCategory.family),
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
      Celebration(11, 4, CelebrationCategory.relatives),
      Celebration(11, 7, CelebrationCategory.relatives),
      Celebration(11, 25, CelebrationCategory.family),
      Celebration(11, 28, CelebrationCategory.friends),
      Celebration(12, 7, CelebrationCategory.friends),
      Celebration(12, 14, CelebrationCategory.friends),
      Celebration(12, 19, CelebrationCategory.friends),
      Celebration(12, 31, CelebrationCategory.family),
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
      Celebration(11, 15, CelebrationCategory.family),
      Celebration(11, 20, CelebrationCategory.friends),
      Celebration(11, 29, CelebrationCategory.friends),
      Celebration(11, 30, CelebrationCategory.colleagues),
      Celebration(12, 7, CelebrationCategory.colleagues),
      Celebration(12, 15, CelebrationCategory.friends),
      Celebration(12, 24, CelebrationCategory.family),
      Celebration(12, 31, CelebrationCategory.family),
    ],
    peopleDates: ['24.12.2022', '20.11.2022', 'n/a', '30.11.2022', 'n/a'],
    peopleCount: [10, 20, 37, 41, 0],
    avatarImagePath: "assets/images/avatar2.jpg",
    nextHoliday: '20.11.2022',
    nextHolidayName: 'День рождения',
    nextHolidayIconPath: 'assets/images/friends_group_icon.svg'
  ),
];
