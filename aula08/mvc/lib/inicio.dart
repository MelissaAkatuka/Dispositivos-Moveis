import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InicioView extends StatefulWidget {
  InicioView({Key? key}) : super(key: key);

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  TextEditingController _controllerTexto = TextEditingController();

  String _texto = "Ainda Não Existe Nada Salvo";

  void _salvar() async{
    String valorDigitado = _controllerTexto.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("texto", valorDigitado);
    print("operação: (salvar): $valorDigitado");
  }

  void _recuperar() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _texto = prefs.getString("texto")!;
    });
    print("operação: (recuperar): $_texto");
  }

  void _remover() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("texto");
    print("operação: (remover): $_texto");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(children: [
          Text(
            _texto,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextField(
            controller: _controllerTexto,
            decoration: InputDecoration(
              labelText: "Digite algo",
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: _salvar,
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: _recuperar,
                  child: Text(
                    "Recuperar",
                    style: TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: _remover,
                  child: Text(
                    "Apagar",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
