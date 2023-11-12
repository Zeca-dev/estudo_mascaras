extension DateTimeExtension on DateTime {
  dateToStringEnglishPattern() => toString().split('.')[0];
  dateToStringEnglishPatternAbrev() => toString().split(' ')[0];
}
