import 'package:intl/intl.dart';

class DateConvert {
  DateConvert();
  dayWeek(DateTime d) => DateFormat('E', 'pt_Br').format(d);
  dayWeekComplet(DateTime d) => DateFormat('EEEE', 'pt_BR').format(d);
  dateBrString(DateTime d) => DateFormat('dd/MM/yyyy').format(d);
  date(DateTime d) => DateFormat('yyyy/mm/dd').format(d);
  dateBrWeekDayMonth(DateTime d) =>
      DateFormat('E dd/MM', 'pt_Br').format(d).toUpperCase();
  dateBrWeekDayMonthYear(DateTime d) =>
      DateFormat('E dd/MM/yyyy', 'pt_Br').format(d).toUpperCase();
}
