import 'package:estudo_mascaras/utils/formatter_string.dart';
import 'package:estudo_mascaras/utils/input_formatters/cnpj_input_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/cpf_input_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/currency_input_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/generic_input_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Formater String Tests', () {
    test('Deve retornar uma string com o formatador passado', (() {
      expect(formatString('11122233300', CpfInputFormater()), equals('111.222.333-00'));
      expect(formatString('01123456000100', CnpjInputFormater()), equals('01.123.456/0001-00'));
      expect(formatString('123320', CurrencyInputFormater()), equals(r'R$ 1.233,20'));
      expect(
          formatString('12112023', GenericInputFormater(mask: '##/##/####')), equals('12/11/2023'));
    }));
  });
}
