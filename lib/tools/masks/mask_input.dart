import 'package:flutter/services.dart';

//Máscaras para CPF, CNPJ e data (dd/MM/aaaa)
class MaskInput extends TextInputFormatter {
  final String mask;

  MaskInput(this.mask);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = newValue.text.replaceAll(RegExp(r'\D'), '');
    var formatted = mask;
    if (value.length > mask.length) return oldValue;

    for (var i = 0; i < value.length; i++) {
      formatted = formatted.replaceFirst('#', value[i]);
    }

    final lastHash = formatted.indexOf('#');
    if (lastHash != -1) {
      formatted = formatted.substring(0, lastHash);
      if (RegExp(r'\D$').hasMatch(formatted)) {
        formatted = formatted.substring(0, formatted.length - 1);
      }
    }

    return newValue.copyWith(
        text: formatted,
        selection:
            TextSelection.fromPosition(TextPosition(offset: formatted.length)));
  }
}
