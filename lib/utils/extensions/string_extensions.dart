import 'package:estudo_mascaras/utils/formatter_string.dart';
import 'package:estudo_mascaras/utils/input_formatters/cnpj_input_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/cpf_input_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/generic_input_formatter.dart';

extension FormaterExetnsion on String {
  ///Remove todos os caracteres espeicias de uma string
  String removerCaracteresEspeciais() => replaceAll(RegExp(r'[^\d\w]'), '');

  ///Coloca a primeira letra de uma string em Maísculo
  ///Se [isComplete] == true, irá capitalizar frases inteiras
  String capitalizar({bool isComplete = false}) {
    if (isNotEmpty) {
      if (isComplete) {
        List<String> preposicoes = [
          'o',
          'a',
          'os',
          'as',
          'da',
          'das',
          'do',
          'dos',
          'de',
          'em',
          'na',
          'no',
        ];
        List<String> palavras = toLowerCase().trim().split(' ');

        final result = palavras
            .map((palavra) => preposicoes.contains(palavra)
                ? palavra
                : '${palavra[0].toUpperCase()}${palavra.substring(1).toLowerCase()}')
            .join(' ');

        return '${result[0].toUpperCase()}${result.substring(1)}';
      }
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    }
    return this;
  }

  ///Formata um CPF: 000.000.000-00 ou CNPJ: 00.000.000/00001-00
  String formatarCpfOuCnpj() {
    final cpfCnpj = removerCaracteresEspeciais().trim();

    return switch (cpfCnpj.length) {
      11 => formatString(this, CpfInputFormater()),
      14 => formatString(this, CnpjInputFormater()),
      _ => throw ArgumentError(cpfCnpj.length < 11 ? 'CPF inválido!' : 'CNPJ inválido!')
    };
  }

  ///Formata um telefone: (99) 9999-9999 ou (99)9 9999-9999
  String formatarTelefone() {
    final telefone = removerCaracteresEspeciais().trim();

    if (telefone.isEmpty) {
      return throw ArgumentError('Celular inválido!');
    }

    return switch (telefone.length) {
      10 => formatString(this, GenericInputFormater(mask: '(##) ####-####')),
      11 => formatString(this, GenericInputFormater(mask: '(##)# ####-####')),
      _ => throw ArgumentError('Telefone inválido!')
    };
  }

  ///Retorna um CEP no formato: 00.000-000
  String formatarCep() {
    final cep = removerCaracteresEspeciais().trim();

    if (cep.length != 8) {
      return throw ArgumentError('Cep inválido!');
    }

    return formatString(this, GenericInputFormater(mask: '##.###-###'));
  }
}

///Extensions para realizar cast de String
extension CastExtension on String {
  ///Retorna um DateTime a partir de uma data.
  ///Formato de entrada: dd/MM/yyyy
  DateTime toDateTime() {
    if (length != 10) {
      return throw ArgumentError('Data inválida');
    }
    try {
      final dateSplited = split('/');
      return DateTime(
          int.parse(dateSplited[2]), int.parse(dateSplited[1]), int.parse(dateSplited[0]));
    } catch (error) {
      return throw ArgumentError('Data inválida');
    }
  }
}
