
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;


String dateTimeToStringFormat(DateTime date){
final brussels = tz.getLocation('Europe/Brussels');

final datetime = tz.TZDateTime.from(date, brussels);
final formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").format(datetime);

final timeZoneOffset = datetime.timeZoneOffset;
final hoursOffset = timeZoneOffset.inHours.abs().toString().padLeft(2, '0');
final minutesOffset = (timeZoneOffset.inMinutes.abs() % 60).toString().padLeft(2, '0');
final sign = timeZoneOffset.isNegative ? '-' : '+';
final formattedOffset = '$sign$hoursOffset:$minutesOffset';
print(formattedOffset);
final formattedDateTime = '$formattedDate$formattedOffset[Europe/Brussels]';

print(formattedDateTime);
return formattedDateTime;
}