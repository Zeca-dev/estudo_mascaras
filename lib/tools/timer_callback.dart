// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

///Timer para execução de buscas por texto digitado
///
///Recebe um tempo em [milisseconds] e executa uma calback ao final do timer.
class TimerCallback {
  ///Tempo em [milisseconds] para execução de uma calback ao final do timer.
  final int milisseconds;
  Timer? _timer;
  TimerCallback({
    required this.milisseconds,
  });

  ///[callback] que será executada ao fina do Timer
  void call({required VoidCallback callback}) {
    cancel();
    _timer = Timer(Duration(milliseconds: milisseconds), callback);
  }

  ///Cancela o timer
  void cancel() => _timer?.cancel();
}
