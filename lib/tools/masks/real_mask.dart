import 'package:flutter/services.dart';

//Máscaras moeda real
class Realmask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = newValue.text.replaceAll(RegExp(r'\D'), '');

    value = (int.tryParse(value) ?? 0).toString();

    if (value.length < 3) {
      value = value.padLeft(3, '0');
    }

    var valueList = value.split('').reversed.join();

    var formatted = r'R$ ';

    final resultList = [];

    for (var i = 0; i < valueList.length; i++) {
      if (i == 2) {
        resultList.insert(0, ',');
      }
      if ((i + 1) % 3 == 0 && i != 0 && (i + 1) != 3) {
        resultList.insert(0, '.');
      }
      resultList.insert(0, valueList[i]);
    }

    formatted += resultList.join();

    return newValue.copyWith(
        text: formatted,
        selection:
            TextSelection.fromPosition(TextPosition(offset: formatted.length)));
  }
}
