import 'package:flutter/services.dart';

format(String value, TextInputFormatter formatter) {
  return formatter.formatEditUpdate(TextEditingValue(text: ''), TextEditingValue(text: value)).text;
}
