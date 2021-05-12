import 'package:intl/intl.dart';

class DatesFormaterUtil {
  static String daysMonthsYearsFormat(DateTime date) {
    var formatter = new DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(date);
  }
}
