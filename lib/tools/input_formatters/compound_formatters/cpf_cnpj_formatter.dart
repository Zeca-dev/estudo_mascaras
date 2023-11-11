import 'package:estudo_mascaras/tools/input_formatters/cnpj_input_formatter.dart';
import 'package:estudo_mascaras/tools/input_formatters/compound_formatters/compund_formatter.dart';
import 'package:estudo_mascaras/tools/input_formatters/cpf_input_formatter.dart';

///Formatter para CPF ou CNPJ
///Utilize [FilteringTextInputFormatter.digitsOnly].
class CpfOuCnpjFormatter extends CompoundFormatter {
  CpfOuCnpjFormatter() : super([CpfInputFormater(), CnpjInputFormater()]);
}
