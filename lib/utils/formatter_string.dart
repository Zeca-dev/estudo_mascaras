import 'package:flutter/services.dart';

String formatString(String value, TextInputFormatter formatter) {
  return formatter.formatEditUpdate(TextEditingValue(text: ''), TextEditingValue(text: value)).text;
}
