import 'package:intl/intl.dart';

class DatesFormaterUtil {
  static String daysMonthsYearsFormat(DateTime date) {
    var formatter = new DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }
}
