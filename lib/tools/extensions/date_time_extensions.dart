import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const br = 'pt_BR';

/// Extensões para objetos DateTime em pt_BR
extension DateTimeExtensions on DateTime {
  /// Retorna o dia.
  /// Ex: `22`
  String dia() {
    initializeDateFormatting();
    return DateFormat.d(br).format(this);
  }

  /// Retorna o dia da semana abreviado.
  ///Se [isUpperCase] for igual a true irá retornar como maiúsculas.
  ///Default: isUpperCase = false.
  /// Ex: `qua` ou `QUA`.
  String diaSemanaAbrev({bool isUpperCase = false}) {
    initializeDateFormatting();
    return isUpperCase
        ? DateFormat.E(br).format(this).toUpperCase()
        : DateFormat.E(br).format(this);
  }

  /// Retorna o dia da semana.
  /// Ex: `quarta-feira`
  String diaSemana() {
    initializeDateFormatting();
    return DateFormat.EEEE(br).format(this);
  }

  /// Retorna o nome do mês abreviado.
  ///
  /// Ex: `abr`
  String mesAbrev({bool isUpperCase = false}) {
    initializeDateFormatting();
    return isUpperCase
        ? DateFormat.LLL(br).format(this).toUpperCase()
        : DateFormat.LLL(br).format(this);
  }

  /// Retorna o nome do mês.
  ///
  /// Ex: `abril`
  String mes() {
    initializeDateFormatting();
    return DateFormat.LLLL(br).format(this);
  }

  /// Retorna `1` até `12` de acordo com o mês do ano.
  String mesNoAno() {
    initializeDateFormatting();
    return DateFormat.M(br).format(this);
  }

  /// Retorna dia e mês no formato `dd/mm`.
  /// Ex: `22/04`
  String diaMes() {
    initializeDateFormatting();
    return DateFormat.Md(br).format(this);
  }

  /// Retorna dia da semana e mês no formato `[semana], dd/mm`.
  /// Ex: `qua., 22/04`
  String diaSemanaEMes() {
    initializeDateFormatting();
    return DateFormat.MEd(br).format(this);
  }

  /// Retorna o dia da semana e mês no formato `[dia] de [mes]`.
  /// Ex: `22 de abr.`
  String diaMesAbrev() {
    initializeDateFormatting();
    return DateFormat.MMMd(br).format(this);
  }

  /// Retorna dia, mês e ano no formato `dd/mm/aaaa`.
  ///
  /// Ex: `dom., 12 de nov.`.
  String diaSemanaMesAbrev() {
    initializeDateFormatting();
    return DateFormat.MMMEd(br).format(this);
  }

  /// Retorna dia e mês por extenso no formato: `[dia] de [mes]`.
  /// Ex: `22 de abril`
  String diaMesExt() {
    initializeDateFormatting();
    return DateFormat.MMMMd(br).format(this);
  }

  /// Retorna dia da seamana e mês por extenso no formato: `[semana], [dia] de [mes]`.
  /// Ex: `quarta-feira, 22 de abril`
  String diaSemanaMesExt() {
    initializeDateFormatting();
    return DateFormat.MMMMEEEEd(br).format(this);
  }

  /// Retorna ano.
  /// Ex: `1987`
  String ano() {
    initializeDateFormatting();
    return DateFormat.y(br).format(this);
  }

  /// Retorna dia, mês e ano no formato `dd/mm/aaaa`.
  /// Ex: `22/04/1987`
  String diaMesAno() {
    initializeDateFormatting();
    return DateFormat.yMd(br).format(this);
  }

  /// Retorna dia da semana, mês e ano no formato `[semana], dd/mm/aaaa`.
  /// Ex: `qua., 22/04/1987 ou QUA., 22/04/1987`
  String semanaDiaMesAnoAbrev({bool isUpperCase = false}) {
    initializeDateFormatting();
    return isUpperCase
        ? DateFormat.yMEd(br).format(this).toUpperCase()
        : DateFormat.yMEd(br).format(this);
  }

  /// Retorna dia, mês e ano por extenso no formato `[semana], [dia] de [mes] de [ano]`.
  /// Ex: `quarta-feira, 22 de abril de 1987`
  String semanaDiaMesAnoExt() {
    initializeDateFormatting();
    return DateFormat.yMMMMEEEEd(br).format(this);
  }

  /// Retorna dia, mês e ano no formato `[dia] de [mes] de [ano]`.
  /// Ex: `22 de abr. de 1987`
  String diaMesAnoAbrev() {
    initializeDateFormatting();
    return DateFormat.yMMMd(br).format(this);
  }

  /// Retorna dia, mês e ano por extenso no formato `[dia] de [mes] de [ano]`.
  /// Ex: `22 de abril de 1987`
  String diaMesAnoExt() {
    initializeDateFormatting();
    return DateFormat.yMMMMd(br).format(this);
  }

  /// Retorna hora (24h).
  /// Ex: `23`
  String hora() {
    initializeDateFormatting();
    return DateFormat.H(br).format(this);
  }

  /// Retorna minuto.
  /// Ex: `37`
  String minuto() {
    initializeDateFormatting();
    return DateFormat.m(br).format(this);
  }

  /// Retorna hora e minuto (24h).
  /// Ex: `23:37`
  String horaMinuto() {
    initializeDateFormatting();
    return DateFormat.Hm(br).format(this);
  }

  /// Retorna hora, minuto e segundo (24h).
  /// Ex: `23:37:06`
  String horaMinutoSegundo() {
    initializeDateFormatting();
    return DateFormat.Hms(br).format(this);
  }

  /// Retorna minuto e segundo (24h).
  /// Ex: `37:06`
  String minutoSegundo() {
    initializeDateFormatting();
    return DateFormat.ms(br).format(this);
  }

  /// Retorna dia, mes, ano, hora e minuto.
  /// Ex: `22/04/1987 23:37`
  String diaMesAnoHoraMinuto() {
    initializeDateFormatting();
    return DateFormat.yMd(br).add_Hm().format(this);
  }
}
