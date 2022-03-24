import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _valorCheck1 = false;
  bool _valorCheck2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Azul"),
            Checkbox(
              value: _valorCheck1,
              onChanged: (valor) {
                setState(() {
                  _valorCheck1 = valor!;
                });
              },
            ),
            CheckboxListTile(
                title: const Text("Amarelo"),
                value: _valorCheck2,
                onChanged: (valor) {
                  setState(() {
                    _valorCheck2 = valor!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
