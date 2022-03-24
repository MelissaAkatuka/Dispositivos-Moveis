import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String _escolhaRadio = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          RadioListTile(
            title: const Text("Vermelho"),
            value: "vermelho",
            groupValue: _escolhaRadio,
            onChanged: (escolha) {
              setState(() {
                _escolhaRadio = escolha.toString();
              });
            },
          ),
          RadioListTile(
            title: const Text("Laranja"),
            value: "laranja",
            groupValue: _escolhaRadio,
            onChanged: (escolha) {
              setState(() {
                _escolhaRadio = escolha.toString();
              });
            },
          )
        ]),
      ),
    );
  }
}
