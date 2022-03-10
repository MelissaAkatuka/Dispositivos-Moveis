import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

   final List<String> _frases = [
    "A coragem não é ausência do medo; é a persistência apesar do medo. -Batman",
    "Acerte em tudo que puder acertar. Mas não se torture com seus erros. -Paulo Coelho",
    "Você nunca sabe que resultados virão da sua ação. Mas se você não fizer nada, não existirão. -Mahatma Gandhi",
    "É melhor você tentar algo, vê-lo não funcionar e aprender com isso, do que não fazer nada. -Mark Zuckerberg",
    "A persistência é o caminho do êxito. -Charles Chaplin",
  ];

  String _fraseGerada = "Clique abaixo para gerar uma frase";

  void gerarFrase(){
    int aleatorio = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[aleatorio];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Coach Motivacional"),
          backgroundColor: Colors.purple.shade900,
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.asset(
              'img/coach.png',
            ),
            Text(
              _fraseGerada,
              style: const TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
            ElevatedButton(
                onPressed: gerarFrase, 
                child: Text('Nova frase'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade900,
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                )
                )
          ]),
        ));
  }
}
