// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:estudo_mascaras/utils/extensions/string_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[Extension String tests] ', () {
    test('Dve remover caracteres especiais de uma String.', (() {
      final result =
          r' ! @ # $ % ^ & * (){}[],./\ ` ~ : ; " ? ' ' '.trim().removerCaracteresEspeciais();

      expect(result, equals(''));
    }));

    test('Deve formatar um CPF.', () {
      final cpf = '12345678900'.formatarCpfOuCnpj();
      expect(cpf, equals('123.456.789-00'));
    });

    test('Deve formatar um CNPJ.', () {
      final cnpj = '01123456000100'.formatarCpfOuCnpj();
      expect(cnpj, equals('01.123.456/0001-00'));
    });

    test('Deve retornar um throw ArgumentError ao receber um tamanho de inválido de CPF ou CNPJ.',
        () {
      expect(() => '01123'.formatarCpfOuCnpj(), throwsArgumentError);
    });

    test('Deve formatar um Telefone (99)9 9999-9999. ou (99) 9999-9999.', () {
      expect('99 999999999'.formatarTelefone(), equals('(99)9 9999-9999'));
      expect('99 99999999'.formatarTelefone(), equals('(99) 9999-9999'));
    });

    test('Deve retornar um throw ArgumentError ao receber um tamanho de inválido de Telefone.', () {
      expect(() => '8499999'.formatarTelefone(), throwsArgumentError);
    });

    test('Deve formatar um CEP 00.000-000.', () {
      expect('00000000'.formatarCep(), equals('00.000-000'));
    });

    test('Deve retornar um throw ArgumentError ao receber um tamanho de CEP inválido.', () {
      expect(() => '00000'.formatarCep(), throwsArgumentError);
    });

    test('Deve retornar um DateTime a partir de uma string válida (dd/MM/yyyy).', () {
      expect('12/11/2023'.toDateTime(), isA<DateTime>());
      expect('12/11/2023'.toDateTime(), equals(DateTime(2023, 11, 12)));
    });

    test(
        'Deve retornar um throw ArgumentError ao receber uma string de data diferente de (dd/MM/yyyy).',
        () {
      expect(() => '12/11/23'.toDateTime(), throwsArgumentError);
    });

    test('Deve retornar uma string capitalizada (em maiúsculo).', () {
      expect('teste concluído com sucesso!'.capitalizar(), equals('Teste concluído com sucesso!'));
      expect('fulano ciclano da silva'.capitalizar(isComplete: true),
          equals('Fulano Ciclano da Silva'));
      expect('fulano ciclano de beltrano'.capitalizar(isComplete: true),
          equals('Fulano Ciclano de Beltrano'));
    });

    //
  });
}

class Teste {
  final String nome;
  final int idade;
  Teste({
    required this.nome,
    required this.idade,
  });
}
