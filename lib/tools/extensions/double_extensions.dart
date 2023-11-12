import 'package:estudo_mascaras/tools/extensions/string_extensions.dart';
import 'package:estudo_mascaras/tools/formatter_output.dart';
import 'package:estudo_mascaras/tools/input_formatters/currency_input_formatter.dart';

extension DoubleExtension on double {
  String toMoeda({bool withSimbol = true}) => withSimbol
      ? format(toStringAsFixed(2).removerCaracteresEspeciais(), CurrencyInputFormater())
      : format(toStringAsFixed(2).removerCaracteresEspeciais(), CurrencyInputFormater(symbol: ''));
}
