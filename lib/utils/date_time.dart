class DateTimeUtil {

  static List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    'May',
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  static String getMonthFromIndex (int index){

    try {
      return months[index];
    }
    on RangeError {
      return "";
    }
  }
}