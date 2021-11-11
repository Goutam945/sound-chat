import 'package:intl/intl.dart';

class DateFormatter {
  static String getMonth(DateTime date) {
    return DateFormat.MMM().format(date);
  }

  static String getHM(DateTime date) {
    return DateFormat.Hm().format(date);
  }
}
