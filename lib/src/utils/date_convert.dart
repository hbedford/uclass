import 'package:intl/intl.dart';

class DateConvert {
  DateConvert();
  dayWeek(DateTime d) => DateFormat('E', 'pt_Br').format(d);
}
