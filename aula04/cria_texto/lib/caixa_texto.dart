import 'dart:html';

import 'package:flutter/material.dart';

class CaixaTexto extends StatefulWidget {
  const CaixaTexto({Key? key}) : super(key: key);

  @override
  _CaixaTextoState createState() => _CaixaTextoState();
}

class _CaixaTextoState extends State<CaixaTexto> {

GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _campo1 = TextEditingController();
TextEditingController _campo2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
//var texto;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Dados"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
            child: Column(
          children: [
            TextFormField(
              controller: _campo1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: " Valor em reais",
                prefixText: "R\$ ",
                labelText: "Conta Bancária",
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 25, 150, 0),
                  fontSize: 25,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 204, 105),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 187, 16),
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.red,
                )),
              ),
              cursorColor: Colors.greenAccent,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              validator: (texto) {
                return texto!.length < 3 || texto.length > 6
                    ? "Entre 3 a 6 caracteres"
                    : null;
              },
            ),
            TextFormField(
              controller: _campo2,
              validator: (texto){
                return texto!.isEmpty
                ? "Texto em branco" : null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                //verificar se o estado do form é válido
                if(_formKey.currentState!.validate()){
                  print(_campo1.text);
                }
              },
              child: const Text("Clicar"),
            ),
          ],
        )),
      ),
    );
  }
}
