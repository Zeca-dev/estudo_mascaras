import 'package:flutter/services.dart';

class CPFMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var cpf = newValue.text;
    if (cpf.length > 14) return oldValue;
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    var formatted = '';

    for (var i = 0; i < cpf.length; i++) {
      if ([3, 6, 9].contains(i)) {
        formatted += i == 9 ? '-' : '.';
      }
      formatted += cpf[i];
    }
    return newValue.copyWith(
        text: formatted,
        selection:
            TextSelection.fromPosition(TextPosition(offset: formatted.length)));
  }
}
