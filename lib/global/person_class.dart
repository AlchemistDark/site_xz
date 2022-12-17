/// Person data model.

class Person{
  final String userName; // server JSON "username":"NatalyaBloom",
  final String region; // server JSON "region":"Тула"
  final List<Celebrate> celebrates; // server JSON "holidays":
  final List<String> peopleDates; // server JSON "people_dates":[null,null,null,null,null]
  final List<int> peopleCount; // server JSON "people_count":[1,0,0,0,0]

  Person({
    required this.userName,
    required this.region,
    required this.celebrates,
    required this.peopleDates,
    required this.peopleCount,
  });

  // ToDO Здесь могут быть ошибки, если сервер возвращает null
  factory Person.fromJson(Map<String, dynamic> json){
    return Person(
      userName: json["username"] as String,
      region: json["region"] as String,
      celebrates: (json["holidays"] as List<dynamic>)
        .map((dynamic e) => Celebrate.fromJson(e as Map<String, dynamic>))
        .toList(),
      peopleDates: (json["people_dates"] as List<dynamic>)
        .map((dynamic e) {
          if (e == null) {return "null";}
          return e as String;
        }).toList(),
      peopleCount: (json["people_count"] as List<dynamic>)
        .map((dynamic e) => e as int)
        .toList(),
    );
  }
}

class Celebrate{
  final int id; // server JSON "id":421,
  final String name; // server JSON "name":"Свадебное торжество",
  final String date; // server JSON "date":"2022-07-07",
  final int month; // server JSON "month":6,
  final int day; // server JSON "day":8,
  final List<int> celebrateCategory; // server JSON "holiday_cat":1,
  final List<int> peopleCategory; // server JSON "people_cat":1,
  final String icon; // server JSON "icons":"icon66"},

  Celebrate({
    required this.id,
    required this.name,
    required this.date,
    required this.month,
    required this.day,
    required this.celebrateCategory,
    required this.peopleCategory,
    required this.icon,
  });

  // ToDo Здесь могут быть ошибки, если сервер возвращает null
  factory Celebrate.fromJson(Map<String, dynamic> json){
    return Celebrate(
      id: json["id"] as int,
      name: json["name"] as String,
      date: json["date"] as String,
      month: json["month"] as int,
      day: json["day"] as int,
      celebrateCategory: (json["holiday_cat"] as List<dynamic>)
        .map((dynamic e) => e as int)
        .toList(),
      peopleCategory: (json["people_cat"] as List<dynamic>)
        .map((dynamic e) => e as int)
        .toList(),
      icon: json["icons"] as String
    );
  }
}