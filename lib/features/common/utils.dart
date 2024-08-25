
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


String dateTimeToStringFormat(DateTime date){
final brussels = tz.getLocation('Europe/Brussels');

// Belirli bir tarih ve saat oluştur

final datetime = tz.TZDateTime.from(date, brussels); //tz.TZDateTime(brussels, date.year, date.month, date.day, date.hour, date.minute);

// ISO 8601 formatında tarih ve saat oluştur
final formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").format(datetime);

// Zaman dilimi ofsetini al
final timeZoneOffset = datetime.timeZoneOffset;
final hoursOffset = timeZoneOffset.inHours.abs().toString().padLeft(2, '0');
final minutesOffset = (timeZoneOffset.inMinutes.abs() % 60).toString().padLeft(2, '0');
final sign = timeZoneOffset.isNegative ? '-' : '+';
final formattedOffset = '$sign$hoursOffset:$minutesOffset';
print(formattedOffset);
// Timezone'u köşeli parantezler içinde ekleyin
final formattedDateTime = '$formattedDate$formattedOffset[Europe/Brussels]';

// Sonuç
print(formattedDateTime);
return formattedDateTime;
}