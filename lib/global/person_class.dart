/// Person data model.

class Person{
  final String userName; // server JSON "username":"NatalyaBloom",
  final String region; // server JSON "region":"Тула"
  final List<Celebrate> celebrates; // server JSON "holidays":
  final List<List<String>> peopleDates; // server JSON "people_dates":[null,null,null,null,null]
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
          if (e == null) {return ["null"];}
          List<String> result = [];
          for (var i in e){
            String str = i as String;
            result.add(str);
          }
          return result;
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

class Contact{

  final int id;
  final String name;
  final int sex;
  final String region;
  final String birthday;
  final String phone;
  final String telegram;
  final String email;
  final int status;
  final int cat;

  Contact({
    required this.id,
    required this.name,
    required this.sex,
    required this.region,
    required this.birthday,
    required this.phone,
    required this.telegram,
    required this.email,
    required this.status,
    required this.cat
  });

  factory Contact.fromJson(Map<String, dynamic> json){
    return Contact(
      id: json["id"] as int,
      name: json["name"] as String,
      sex: (json["sex"] == false)? 0 : 1,
      region: json["region"] as String,
      birthday: json["birthday"] as String,
      phone: (json["phoneNumber"] != null)? json["phoneNumber"] as String : "null",
      telegram: (json["telegram"] != null)? json["telegram"] as String : "null",
      email: (json["email"] != null)? json["email"] as String : "null",
      status: (json["status"] != null)? json["status"] as int : 1,
      cat: (json["cat"] != null)? json["cat"] as int : 1
    );
  }
}