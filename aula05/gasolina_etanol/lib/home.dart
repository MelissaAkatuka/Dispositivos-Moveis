import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _gasController = TextEditingController();
  TextEditingController _etanolController = TextEditingController();
  String _resultado = "Resultado";

  void calcular(){
    if(_formKey.currentState!.validate()){
      double gas = double.parse(_gasController.text);
      double etanol = double.parse(_etanolController.text);

      if((etanol/gas) >= 0.7){
        setState(() {
          _resultado = "Melhor Gasolina";
        });
      } else{
        setState(() {
          _resultado = "Melhor Etanol";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade900,
      appBar: AppBar(
        title: const Text("Gasolina ou Etanol"),
        backgroundColor: Colors.amber.shade800,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/img/gas_et.png',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _gasController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "5.999",
                          labelText: "Preço Gasolina",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.amber.shade500,
                          ))),
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      //recebe string e retorna string de validacao
                      validator: (text) {
                        return (text!.isEmpty || double.parse(text) <= 0) ? "Obrigatório e valores maior que 0" : null;
                      }),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _etanolController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "5.999",
                          labelText: "Preço Etanol",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.amber.shade500,
                          ))),
                      cursorColor: Colors.white,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      //recebe string e retorna string de validacao
                      validator: (text) {
                        return text!.isEmpty ? "Obrigatório" : null;
                      }),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                    child: Text(
                      _resultado,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
