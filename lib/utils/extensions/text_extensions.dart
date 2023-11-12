import 'package:flutter/material.dart';

///Extensão para Text
extension TextExtension on Text {
  ///Aplica o estilo Bold [bold].
  Text bold() => Text(data!,
      style: style?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontWeight: FontWeight.bold));

  ///Aplica o estilo Italic [italic].
  Text italic() => Text(data!,
      style: style?.copyWith(fontStyle: FontStyle.italic) ??
          const TextStyle(fontStyle: FontStyle.italic));

  ///Aplica um sublinhado [italic].
  Text underlined() => Text(data!,
      style: style?.copyWith(decoration: TextDecoration.underline) ??
          const TextStyle(decoration: TextDecoration.underline));

  ///Aplica um fontSize [size]
  Text toSize(double size) =>
      Text(data!, style: style?.copyWith(fontSize: size) ?? TextStyle(fontSize: size));

  ///Aplica uma Color [color]
  Text toColor(Color color) =>
      Text(data!, style: style?.copyWith(color: color) ?? TextStyle(color: color));
}

///Extensão para TextSpan
extension TextSpanExtension on TextSpan {
  ///Aplica o estilo Bold [bold].
  TextSpan bold() => TextSpan(
      text: text!,
      children: children,
      style: style?.copyWith(fontWeight: FontWeight.bold) ??
          const TextStyle(fontWeight: FontWeight.bold));

  ///Aplica o estilo Italic [italic].
  TextSpan italic() => TextSpan(
      text: text!,
      children: children,
      style: style?.copyWith(fontStyle: FontStyle.italic) ??
          const TextStyle(fontStyle: FontStyle.italic));

  ///Aplica um sublinhado [italic].
  TextSpan underlined() => TextSpan(
      text: text!,
      children: children,
      style: style?.copyWith(decoration: TextDecoration.underline) ??
          const TextStyle(decoration: TextDecoration.underline));

  ///Aplica um fontSize [size].
  TextSpan toSize(double size) => TextSpan(
      text: text!,
      children: children,
      style: style?.copyWith(fontSize: size) ?? TextStyle(fontSize: size));

  ///Aplica uma Color [color].
  TextSpan toColor(Color color) => TextSpan(
      text: text!,
      children: children,
      style: style?.copyWith(color: color) ?? TextStyle(color: color));
}
