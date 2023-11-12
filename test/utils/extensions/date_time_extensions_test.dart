import 'package:estudo_mascaras/utils/extensions/date_time_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final data = DateTime(2023, 11, 12, 10, 20, 30);
  group('[DateTime Exetensions Test] ', () {
    test('Deve retornar o dia do mês.', (() {
      expect(data.dia(), equals('12'));
    }));

    test('Deve retornar o mes do ano.', (() {
      expect(data.mesNoAno(), equals('11'));
    }));

    test('Deve retornar o ano de uma data.', (() {
      expect(data.ano(), equals('2023'));
    }));

    test('Deve retornar o dia da semana.', (() {
      expect(data.diaSemana(), equals('domingo'));
    }));

    test('Deve retornar o dia da semana abreviado.', (() {
      expect(data.diaSemanaAbrev(), equals('dom.'));
    }));

    test('Deve retornar o mes por extenso', (() {
      expect(data.mes(), equals('novembro'));
    }));

    test('Deve retornar o mes abreviado.', (() {
      expect(data.mesAbrev(), equals('nov.'));
    }));

    test('Deve retornar o dia e mes (12/11).', (() {
      expect(data.diaMes(), equals('12/11'));
    }));

    test('Deve retornar o dia da semana e mes (dom. 12/11).', (() {
      expect(data.diaSemanaEMes(), equals('dom., 12/11'));
    }));

    test('Deve retornar o dia da semana e mes abreviado (12 de nov.).', (() {
      expect(data.diaMesAbrev(), equals('12 de nov.'));
    }));

    test('Deve retornar o dia da semana e o mes abreviados (dom, 12 de nov.).', (() {
      expect(data.diaSemanaMesAbrev(), equals('dom., 12 de nov.'));
    }));

    test('Deve retornar o dia e o mes abreviado (12 de novembro).', (() {
      expect(data.diaMesExt(), equals('12 de novembro'));
    }));

    test('Deve retornar o dia da semana e o mes por extenso (dom, 12 de nov.).', (() {
      expect(data.diaSemanaMesExt(), equals('domingo, 12 de novembro'));
    }));

    test('Deve retornar dia mes e ano (12/11/2023).', (() {
      expect(data.diaMesAno(), equals('12/11/2023'));
    }));

    test(
        'Deve retornar o dia da semana, mes e ano por extenso abreviado (domingo, 12 de novembro de 2023).',
        (() {
      expect(data.semanaDiaMesAnoExt(), equals('domingo, 12 de novembro de 2023'));
    }));

    test('Deve retornar o dia da semana, mes e ano por extenso abreviado (dom, 12/11/2023.).', (() {
      expect(data.semanaDiaMesAnoAbrev(), equals('dom., 12/11/2023'));
      expect(data.semanaDiaMesAnoAbrev(isUpperCase: true), equals('DOM., 12/11/2023'));
    }));

    test('Deve retornar o dia, mes abreviado e ano (12 de novembro de 2023).', (() {
      expect(data.diaMesAnoExt(), equals('12 de novembro de 2023'));
    }));

    test('Deve retornar o dia, mes abreviado e ano (12 de nov. de 2023).', (() {
      expect(data.diaMesAnoAbrev(), equals('12 de nov. de 2023'));
    }));

    test('Deve retornar a hora de uma data.', (() {
      expect(data.hora(), equals('10'));
    }));

    test('Deve retornar os minutos de uma data.', (() {
      expect(data.minuto(), equals('20'));
    }));

    test('Deve retornar hora e minutos de uma data.', (() {
      expect(data.horaMinuto(), equals('10:20'));
    }));

    test('Deve os hora, minutos e segundos de uma data.', (() {
      expect(data.horaMinutoSegundo(), equals('10:20:30'));
    }));

    test('Deve retornar data e hora de uma data (12/11/203 10:20).', (() {
      expect(data.diaMesAnoHoraMinuto(), equals('12/11/2023 10:20'));
    }));

    //
  });
}
