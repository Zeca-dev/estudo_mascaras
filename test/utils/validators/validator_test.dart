import 'package:estudo_mascaras/utils/validators/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[Validator Tests] ', () {
    test('Deve retornar errorText se a entrada for nulo ou vazio.', (() {
      expect(RequiredValidator(errorText: 'errorText')(null), 'errorText');
      expect(RequiredValidator(errorText: 'errorText')(''), 'errorText');
    }));

    test('Deve retornar errorText se o tamanho da entrada exceder o valor passado.', (() {
      expect(MaxLengthValidator(5, errorText: 'errorText')('testes'), 'errorText');
    }));

    test('Deve retornar null se o tamanho da entrada nåo exceder o valor passado.', (() {
      expect(MaxLengthValidator(5, errorText: 'errorText')('test'), null);
    }));

    test(
        'Deve retornar errorText se o tamanho da entrada for menor que o tamanho do valor passado.',
        (() {
      expect(MinLengthValidator(5, errorText: 'errorText')('test'), 'errorText');
    }));

    test('Deve retornar null se o tamanho da entrada form maior ou igual ao valor passado.', (() {
      expect(MinLengthValidator(5, errorText: 'errorText')('teste'), null);
    }));

    test('Deve retornar errorText se o tamanho da entrada não estiver dentro do intervalo passado.',
        (() {
      expect(LengthRangeValidator(min: 2, max: 5, errorText: 'errorText')('1'), 'errorText');
      expect(LengthRangeValidator(min: 2, max: 5, errorText: 'errorText')('6'), 'errorText');
    }));

    test('Deve retornar null se o tamanho da entrada estiver dentro do intervalo passado.', (() {
      expect(LengthRangeValidator(min: 2, max: 5, errorText: 'errorText')('test'), null);
    }));

    test(
        'Deve retornar errorText se o valor numérico da entrada não estiver dentro do intervalo passado.',
        (() {
      expect(RangeValidator(min: 2, max: 5, errorText: 'errorText')('1'), 'errorText');
      expect(RangeValidator(min: 2, max: 5, errorText: 'errorText')('6'), 'errorText');
    }));

    test('Deve retornar null se o valor numérico da entrada estiver dentro do intervalo passado.',
        (() {
      expect(RangeValidator(min: 2, max: 5, errorText: 'errorText')('4'), null);
    }));

    test('Deve retornar errorText a entrada tiver um e-mail inválido.', (() {
      expect(EmailValidator(errorText: 'errorText')(null), 'errorText');
      expect(EmailValidator(errorText: 'errorText')('email@email.c'), 'errorText');
      expect(EmailValidator(errorText: 'errorText')('@email.com'), 'errorText');
      expect(EmailValidator(errorText: 'errorText')('email@.com'), 'errorText');
      expect(EmailValidator(errorText: 'errorText')('emailemail.com'), 'errorText');
      expect(EmailValidator(errorText: 'errorText')('email@emailcom'), 'errorText');
      expect(EmailValidator(errorText: 'errorText')('email@email.'), 'errorText');
    }));

    test('Deve retornar null se a entrada tiver um e-mail válido.', (() {
      expect(EmailValidator(errorText: 'errorText')('emai@email.com'), null);
    }));

    test('Deve retornar null se a entrada atende ao padrão passado.', (() {
      expect(PatternValidator(r'//.*', errorText: 'errorText')('//comentário'), null);
    }));

    test('Deve retornar errorText se a entrada não atende ao padrão passado.', (() {
      expect(PatternValidator(r'//.*', errorText: 'errorText')('/*comentário'), 'errorText');
    }));

    test('Deve retornar errorText se a entrada tiver uma data inválida.', (() {
      expect(DateValidator('dd/MM/yyyy', errorText: 'errorText')('12/11/202'), 'errorText');
      expect(DateValidator('dd/MM/yyyy', errorText: 'errorText')('10/15/2023'), 'errorText');
    }));

    test('Deve retornar null se a entrada tiver uma data válida.', (() {
      expect(DateValidator('dd/MM/yyyy', errorText: 'errorText')('12/11/2023'), null);
    }));

    test('Deve retornar errorText se a entrada for inválida para algum validador da lista passada.',
        (() {
      expect(
          MultiValidator([
            RequiredValidator(errorText: 'errorText'),
            MinLengthValidator(5, errorText: 'errorText'),
            PatternValidator(r'//.*', errorText: 'errorText'),
          ])('test'), //A entrada não é um comentário (r'//.*')
          'errorText');
    }));

    test('Deve retornar null se a entrada for válida para todos os validadores da lista passada.',
        (() {
      expect(
          MultiValidator([
            RequiredValidator(errorText: 'errorText'),
            MinLengthValidator(5, errorText: 'errorText'),
            PatternValidator(r'//.*', errorText: 'errorText'),
          ])('//test'),
          null);
    }));

    test('Deve retornar errorText se duas entradas passadas forem diferentes.', (() {
      expect(MatchValidator(errorText: 'errorText').validateMatch('test', 'testE'), 'errorText');
    }));

    test('Deve retornar null se duas entradas passadas forem iguais.', (() {
      expect(MatchValidator(errorText: 'errorText').validateMatch('test', 'test'), null);
    }));
  });
}
