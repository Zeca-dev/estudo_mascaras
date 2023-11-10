import 'package:flutter/services.dart';

class CpfInputFormater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var cpf = newValue.text;
    //123.456.789-00
    if (cpf.length > 14) return oldValue;
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    var formatted = '';

    for (var i = 0; i < cpf.length; i++) {
      if ([3, 6, 9].contains(i)) {
        formatted += switch (i) {
          3 || 6 => '.',
          9 => '-',
          _ => '',
        };
      }
      formatted += cpf[i];
    }
    return newValue.copyWith(
        text: formatted,
        selection: TextSelection.fromPosition(TextPosition(offset: formatted.length)));
  }
}
