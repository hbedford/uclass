import 'package:intl/intl.dart';

class DateConvert {
  DateConvert();
  dayWeek(DateTime d) => DateFormat('E', 'pt_Br').format(d);
  dayWeekComplet(DateTime d) => DateFormat('EEEE', 'pt_BR').format(d);
  dateBrString(DateTime d) => DateFormat('dd/MM/yyyy').format(d);
}
