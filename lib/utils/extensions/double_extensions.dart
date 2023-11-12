import 'package:estudo_mascaras/utils/extensions/string_extensions.dart';
import 'package:estudo_mascaras/utils/formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/currency_input_formatter.dart';

extension DoubleExtension on double {
  String toMoeda({bool withSimbol = true}) => withSimbol
      ? formatString(toStringAsFixed(2).removerCaracteresEspeciais(), CurrencyInputFormater())
      : formatString(
          toStringAsFixed(2).removerCaracteresEspeciais(), CurrencyInputFormater(symbol: ''));
}
