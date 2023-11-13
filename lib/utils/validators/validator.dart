library form_field_validator;

import 'package:estudo_mascaras/utils/validators/interfaces/validator_interface.dart';
import 'package:intl/intl.dart';

/// Mesma assinatura que o validador do FormTextField;
typedef FormFieldValidator<T> = String? Function(T? value);

/// Verifica se uma string bate com o padrão passado
bool hasMatch(String pattern, String input, {bool caseSensitive = true}) =>
    RegExp(pattern, caseSensitive: caseSensitive).hasMatch(input);

///Valida se um campo não é vazio.
class RequiredValidator extends TextFieldValidator<String?> {
  RequiredValidator({required super.errorText});

  @override
  bool isValid(String? value) {
    if (value != null) {
      return value.isNotEmpty;
    }
    return false;
  }

  @override
  String? call(String? value) {
    return isValid(value) ? null : errorText;
  }
}

///Valida se um campo atende ao tamanho máximo [max].
class MaxLengthValidator extends TextFieldValidator<String?> {
  final int max;

  MaxLengthValidator(this.max, {required super.errorText});

  @override
  bool isValid(String? value) {
    return value!.length <= max;
  }
}

///Valida se um campo atende ao tamanho mínimo [min].
class MinLengthValidator extends TextFieldValidator<String?> {
  final int min;

  MinLengthValidator(this.min, {required super.errorText});

  @override
  bool isValid(String? value) {
    return value!.length >= min;
  }
}

///Valida se um campo está entre o tamanho máximo [max] e mínnimo [min]
class LengthRangeValidator extends TextFieldValidator<String?> {
  final int min;
  final int max;

  @override
  LengthRangeValidator({required this.min, required this.max, required super.errorText});

  @override
  bool isValid(String? value) {
    return value!.length >= min && value.length <= max;
  }
}

///Valida se um valor numérico de um campo está entre o
///valor máximo [max] e mínimo [min]
class RangeValidator extends TextFieldValidator<String?> {
  final num min;
  final num max;

  RangeValidator({required this.min, required this.max, required super.errorText});

  @override
  bool isValid(String? value) {
    try {
      final numericValue = num.parse(value!);
      return (numericValue >= min && numericValue <= max);
    } catch (_) {
      return false;
    }
  }
}

///Valida se um campo de e-mail é valido.
class EmailValidator extends TextFieldValidator<String?> {
  /// regex pattern para validação de e-mail.
  final Pattern _emailPattern = r"[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]{3}";

  EmailValidator({required super.errorText});

  @override
  bool isValid(String? value) {
    if (value != null) {
      return hasMatch(_emailPattern.toString(), value, caseSensitive: false);
    }
    return false;
  }
}

///Valida se um campo atende ao padrão regex [pattern]
///considerando o [caseSensitive] passado. Default: `true`.
class PatternValidator extends TextFieldValidator<String?> {
  final Pattern pattern;
  final bool caseSensitive;

  PatternValidator(this.pattern, {required super.errorText, this.caseSensitive = true});

  @override
  bool isValid(String? value) => hasMatch(pattern.toString(), value!, caseSensitive: caseSensitive);
}

///Valida se um campo possui uma data válida considerando
///o [format] passado.
class DateValidator extends TextFieldValidator<String?> {
  final String format;

  DateValidator(this.format, {required super.errorText});

  @override
  bool isValid(String? value) {
    try {
      //dd/MM/yyyy  => tamanho igual a 10
      if (value == null || value.length < 10) {
        return false;
      }
      final DateTime? dateTime = DateFormat(format).parseStrict(value);
      return dateTime != null;
    } catch (_) {
      return false;
    }
  }
}

///Valida se umaa uma listra de validadores é atendida para
///um determinado valor de um campo.
class MultiValidator extends TextFieldValidator<String?> {
  final List<TextFieldValidator> validators;
  static String _errorText = '';

  MultiValidator(this.validators) : super(errorText: _errorText);

  @override
  bool isValid(value) {
    for (TextFieldValidator validator in validators) {
      if (validator.call(value) != null) {
        _errorText = validator.errorText;
        return false;
      }
    }
    return true;
  }

  @override
  String? call(dynamic value) {
    return isValid(value) ? null : _errorText;
  }
}

///Valida se duas entradas são iguais
class MatchValidator {
  final String errorText;

  MatchValidator({required this.errorText});

  String? validateMatch(String value, String value2) {
    return value == value2 ? null : errorText;
  }
}
