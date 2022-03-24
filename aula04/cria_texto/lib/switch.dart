import 'package:flutter/material.dart';

class SwitchButtonState extends StatefulWidget {
  const SwitchButtonState({ Key? key }) : super(key: key);

  @override
  _SwitchButtonStateState createState() => _SwitchButtonStateState();
}

class _SwitchButtonStateState extends State<SwitchButtonState> {

  bool _botao1 = false;
  bool _botao2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SwitchListTile(
            title: Text("Salvar usuário"),
            value: _botao1, 
            onChanged: (valor){
              setState(() {
                _botao1 = valor;
              });
            }),
            SwitchListTile(
            title: Text("Salvar senha"),
            value: _botao2, 
            onChanged: (valor){
              setState(() {
                _botao2 = valor;
              });
            })
        ],
      )
    );
  }
}