import 'package:estudo_mascaras/tools/masks/cpf_mask.dart';
import 'package:estudo_mascaras/tools/masks/mask_input.dart';
import 'package:estudo_mascaras/tools/masks/real_mask.dart';
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
                inputFormatters: [MaskInput('###.###.###-##')],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [MaskInput('##.###.###-####-##')],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CNPJ',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [MaskInput('##/##/####')],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Data',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [Currencymask()],
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
                  Currencymask(
                      symbol: r'$ ', symbolSeparator: ',', decimal: '.')
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'USD',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
