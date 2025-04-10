import 'package:intl/intl.dart';

class DatTimeUtils {
  static String formatDate(DateFormat dateFormat, String time) {
    return dateFormat.format(DateTime.parse(time));
  }

  static DateFormat getDateFormat(String pattern) {
    return DateFormat(pattern);
  }

  static String formatFullMonthOfYear(DateTime date) {
    var suffix = 'th';
    final digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ['st', 'nd', 'rd'][digit - 1];
    }
    return DateFormat("d'$suffix' of MMMM, yyyy").format(date);
  }

  static String dayOfMonth(int day) {
    final dayMap = {1: 'st', 2: 'nd', 3: 'rd'};
    return "$day${dayMap[day] ?? 'th'}";
  }
}

// format types
final utcTimeFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
final dateTimeFormatWithMeridian = DateFormat('dd MMM yyyy, hh:mm a');
final dateTimeFormat = DateFormat('dd MMM, yyyy hh:mm:ss');
final dateFormat = DateFormat('dd MMM yyyy');
final dateFormat1 = DateFormat('dd MMMM yyyy');
final dateFormat2 = DateFormat('MMMM dd, yyyy');
final dateFormat3 = DateFormat('MMM dd, yyyy');
final timeFormat = DateFormat('hh:mm a');
final timeFormat2 = DateFormat('HH:mm a');
final dateMonthTimeFormat = DateFormat('dd MMM, hh:mm a');
final dateMonthFormat = DateFormat('dd MMM');
final monthDateFormat = DateFormat('MMM dd');
final dayFormat = DateFormat('E');
final dayNumberFormat = DateFormat('d');
final apiRangeFormat = DateFormat('yyyy-MM-dd');
final fullMonthYearFormat = DateFormat('MMMM, yyyy');
final fullMonthOfYearFormat = DateFormat('dd of MMMM, yyyy');
