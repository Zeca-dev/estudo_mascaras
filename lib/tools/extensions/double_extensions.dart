import 'package:brasil_fields/brasil_fields.dart';

extension FormatarDouble on double {
  String toMoeda({bool withSimbol = true}) {
    return withSimbol
        ? UtilBrasilFields.obterReal(this)
        : UtilBrasilFields.obterReal(this, moeda: false);
  }
}
