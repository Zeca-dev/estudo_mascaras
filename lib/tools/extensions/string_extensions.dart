import 'package:estudo_mascaras/tools/formatter_output.dart';
import 'package:estudo_mascaras/tools/input_formatters/cnpj_input_formatter.dart';
import 'package:estudo_mascaras/tools/input_formatters/cpf_input_formatter.dart';
import 'package:estudo_mascaras/tools/input_formatters/generic_input_formatter.dart';

extension Formater on String {
  ///Remove todos os caracteres espeicias de uma string
  String removerCaracteresEspeciais() => replaceAll(RegExp(r'[^\d\w]'), '');

  ///Coloca a primeira letra de uma string em Maísculo
  ///Se [isComplete] == true, irá capitalizar frases inteiras
  String capitalizar({bool isComplete = false}) {
    if (isNotEmpty) {
      if (isComplete) {
        List<String> preposicoes = ['o', 'a', 'os', 'as' 'da', 'de', 'do', 'das', 'em', 'na', 'no'];
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
    final cpfCnpj = removerCaracteresEspeciais();

    return switch (cpfCnpj.length) {
      11 => format(this, CpfInputFormater()),
      14 => format(this, CnpjInputFormater()),
      _ => throw ArgumentError(cpfCnpj.length < 11 ? 'CPF inválido!' : 'CNPJ inválido!')
    };
  }

  ///Formata um telefone: (99) 9999-9999 ou (99)9 9999-9999
  String formatarTelefone() {
    final telefone = removerCaracteresEspeciais();

    if (telefone.isEmpty) {
      return throw ArgumentError('Celular inválido!');
    }

    return switch (telefone.length) {
      10 => format(this, GenericInputFormater(mask: '(##) ####-####')),
      11 => format(this, GenericInputFormater(mask: '(##)# ####-####')),
      _ => throw ArgumentError('Telefone inválido!')
    };
  }

  ///Retorna um CEP no formato: 00.000-000
  String formatarCep() {
    final cep = removerCaracteresEspeciais();

    if (cep.length < 8) {
      return throw ArgumentError('Cep inválido!');
    }

    return format(this, GenericInputFormater(mask: '##.###-###'));
  }

  ///Retorna um DateTime a partir de uma data
  ///Formato:dd/MM/yyyy
  DateTime stringToDateTime() {
    try {
      final dateSplited = split('/');
      return DateTime(
          int.parse(dateSplited[2]), int.parse(dateSplited[1]), int.parse(dateSplited[0]));
    } catch (error) {
      return DateTime.now();
    }
  }
}
