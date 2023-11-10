import 'package:estudo_mascaras/tools/input_formaters/cnpj_input_formater.dart';
import 'package:estudo_mascaras/tools/input_formaters/cpf_input_formater.dart';
import 'package:estudo_mascaras/tools/input_formaters/currency_input_formater.dart';
import 'package:estudo_mascaras/tools/input_formaters/generic_input_formater.dart';
import 'package:flutter/material.dart';

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
