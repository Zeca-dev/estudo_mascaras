import 'package:estudo_mascaras/tools/extensions/double_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const valor = 1233.20;
  group('[Double Extensions Tests] ', () {
    test(r'Deve retornar uma valor em formato de moeda (R$ 1.233,20).', (() {
      expect(valor.toMoeda(), equals(r'R$ 1.233,20'));
    }));

    test('Deve retornar uma valor em formato de moeda sem símbolo (1.233,20).', (() {
      expect(valor.toMoeda(withSimbol: false), equals('1.233,20'));
    }));

    //
  });
}
