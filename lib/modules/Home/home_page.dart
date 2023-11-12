import 'package:estudo_mascaras/utils/input_formatters/cnpj_input_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/compound_formatters/cpf_cnpj_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/cpf_input_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/currency_input_formatter.dart';
import 'package:estudo_mascaras/utils/input_formatters/generic_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [CpfInputFormater()],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [CnpjInputFormater()],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CNPJ',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfOuCnpjFormatter(),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF ou CNPJ',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [GenericInputFormater(mask: '##/##/####')],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Data',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [CurrencyInputFormater()],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Real',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [
                  CurrencyInputFormater(symbol: r'$ ', symbolSeparator: ',', decimal: '.')
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'USD',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                //34191.75124 34567.871230 41234.560005 2 95290000026035
                inputFormatters: [
                  GenericInputFormater(
                      mask: '#####.##### #####.###### #####.###### # ##############')
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'BOLETO',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                //34191.75124 34567.871230 41234.560005 2 95290000026035
                inputFormatters: [
                  GenericInputFormater(
                      mask: '###########-# ###########-# ###########-# ###########-#')
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'BOLETO ARRECADAÇÃO',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
