String formatDate(DateTime? mdateTime) {
  if (mdateTime == null) {
    return '';
  }
  DateTime dateTime = mdateTime;
  String formattedDate =
      "${_getMonthName(dateTime.month)} ${dateTime.day.toString().padLeft(2, '0')}, ${dateTime.year}";
  return formattedDate;
}

String _getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'Feb';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'Aug';
    case 9:
      return 'Sept';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}
