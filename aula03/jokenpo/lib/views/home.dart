import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final List<String> _batalha = ["golden", "pincher", "pa",];

  String _imagem = "white_moldura_4";

  void _jogador(String jogador){
    int sorteio = Random().nextInt(3);

    switch (_batalha[sorteio]) {
      case "golden":
        _imagem = "golden_1";

        if(jogador == "pincher"){
          setState(() {
            _resultadoBatalha = "VITÓRIA SISTEMA";
          });
        } else if(jogador == "pa"){
          setState(() {
            _resultadoBatalha = "VITÓRIA JOGADOR";
          });
        } else{
          setState(() {
            _resultadoBatalha = "EMPATE";
          });
        }
        break;
      
      case "pincher":
        _imagem = "pincher_2";

        if(jogador == "pa"){
          setState(() {
            _resultadoBatalha = "VITÓRIA SISTEMA";
          });
        } else if(jogador == "golden"){
          setState(() {
            _resultadoBatalha = "VITÓRIA JOGADOR";
          });
        }else{
          setState(() {
            _resultadoBatalha = "EMPATE";
          });
        }

        break;
      case "pa":
        _imagem = "pa_3";

        if(jogador == "pincher"){
          setState(() {
            _resultadoBatalha = "VITÓRIA JOGADOR";
          });
        } else if(jogador == "golden"){
          setState(() {
            _resultadoBatalha = "VITÓRIA SISTEMA";
          });
        } else{
          setState(() {
            _resultadoBatalha = "EMPATE";
          });
        }

        break;
    }
  }

  final String _resultadoAleatorio = "Faça sua escolha";

  String _resultadoBatalha = "RESULTADO";


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dog Wars"),
          backgroundColor: Colors.greenAccent,
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'img/$_imagem.png',
                ),
                Text(
                  _resultadoAleatorio,
                  style: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _jogador("golden"),
                        child:
                        Image.asset(
                          'img/golden_1.png',
                        ),
                        
                        ),
                      GestureDetector(
                        onTap: () => _jogador("pincher"),
                        child:
                        Image.asset(
                          'img/pincher_2.png',
                          ),
                        ),
                      GestureDetector(
                        onTap: () => _jogador("pa"),
                        child:
                        Image.asset(
                          'img/pa_3.png',
                          ),
                        ),
                    ]),
                Text(
                  _resultadoBatalha,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ]),
        ));
  }
}
