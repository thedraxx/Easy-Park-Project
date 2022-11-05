import 'package:intl/intl.dart';

Formato(date) {
  //final DateFormat format = DateFormat('dd-MM-yyyy');
  //final String formatted = format.format(date);
  var newDt = DateFormat('dd/MM, hh:mm a').format(date);
  return newDt;
}
