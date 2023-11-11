import 'package:estudo_mascaras/tools/input_formatters/interfaces/compoundable_formatters.dart';
import 'package:flutter/services.dart';

class CnpjInputFormater extends TextInputFormatter implements CompoundableFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var cpf = newValue.text;
    //00.123.456/0001-00
    if (cpf.length > 18) return oldValue;
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    var formatted = '';

    for (var i = 0; i < cpf.length; i++) {
      if ([2, 5, 8, 12].contains(i)) {
        formatted += switch (i) {
          2 || 5 => '.',
          8 => '/',
          12 => '-',
          _ => '',
        };
      }
      formatted += cpf[i];
    }
    return newValue.copyWith(
        text: formatted,
        selection: TextSelection.fromPosition(TextPosition(offset: formatted.length)));
  }

  @override
  int get maxLength => 14;
}
