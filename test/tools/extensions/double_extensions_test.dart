import 'package:estudo_mascaras/tools/extensions/double_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const valor = 1233.20;
  const valorFormatado = r'R$ 1.233,20';
  group('[Double Extensions Tests] ', () {
    test('Deve retornar uma valor em formato de moeda.', (() {
      expect(valor.toMoeda(), equals(valorFormatado));
    }));

    test('Deve retornar uma valor em formato de moeda sem símbolo.', (() {
      expect(valor.toMoeda(withSimbol: false), equals('1.233,20'));
    }));

    //
  });
}
