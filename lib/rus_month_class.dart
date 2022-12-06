class RusMonth{
  final int year;
  final int month;

  late String rusLongMonth;
  late String rusShortMonth;
  late String rusCapitalLettersShortMonth;
  late int numberOfDays;

  RusMonth(this.year, this.month){
    // int day = DateTime.now().day;
    // int month = DateTime.now().month;
    // int year = DateTime.now().year;
    switch(month){
      case 1:
        rusLongMonth = 'января';
        rusShortMonth = 'янв';
        rusCapitalLettersShortMonth = 'ЯНВ';
        numberOfDays = 31;
        break;
      case 2:
        rusLongMonth = 'февраля';
        rusShortMonth = 'фев';
        rusCapitalLettersShortMonth = 'ФЕВ';
        if ((year % 4) == 0) {
          numberOfDays = 29;
        } else {
          numberOfDays = 28;
        }
        break;
      case 3:
        rusLongMonth = 'марта';
        rusShortMonth = 'мар';
        rusCapitalLettersShortMonth = 'МАР';
        numberOfDays = 31;
        break;
      case 4:
        rusLongMonth = 'апреля';
        rusShortMonth = 'апр';
        rusCapitalLettersShortMonth = 'АПР';
        numberOfDays = 30;
        break;
      case 5:
        rusLongMonth = 'мая';
        rusShortMonth = 'май';
        rusCapitalLettersShortMonth = 'МАЙ';
        numberOfDays = 31;
        break;
      case 6:
        rusLongMonth = 'июня';
        rusShortMonth = 'июн';
        rusCapitalLettersShortMonth = 'ИЮН';
        numberOfDays = 30;
        break;
      case 7:
        rusLongMonth = 'июля';
        rusShortMonth = 'июл';
        rusCapitalLettersShortMonth = 'ИЮЛ';
        numberOfDays = 31;
        break;
      case 8:
        rusLongMonth = 'августа';
        rusShortMonth = 'авг';
        rusCapitalLettersShortMonth = 'АВГ';
        numberOfDays = 31;
        break;
      case 9:
        rusLongMonth = 'сентября';
        rusShortMonth = 'сен';
        rusCapitalLettersShortMonth = 'СЕН';
        numberOfDays = 30;
        break;
      case 10:
        rusLongMonth = 'октября';
        rusShortMonth = 'окт';
        rusCapitalLettersShortMonth = 'ОКТ';
        numberOfDays = 31;
        break;
      case 11:
        rusLongMonth = 'ноября';
        rusShortMonth = 'ноя';
        rusCapitalLettersShortMonth = 'НОЯ';
        numberOfDays = 30;
        break;
      case 12:
        rusLongMonth = 'декабря';
        rusShortMonth = 'дек';
        rusCapitalLettersShortMonth = 'ДЕК';
        numberOfDays = 31;
        break;
      default:
        rusLongMonth = 'месяц';
        rusShortMonth = 'мес';
        rusCapitalLettersShortMonth = 'МЕС';
        numberOfDays = 30;
    }
  }
}