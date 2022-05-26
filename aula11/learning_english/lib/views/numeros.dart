import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Numeros extends StatefulWidget {
  const Numeros({ Key? key }) : super(key: key);

  @override
  _NumerosState createState() => _NumerosState();
}

class _NumerosState extends State<Numeros> {

  AudioCache _audioCache = AudioCache(prefix: "assets/audios/");

  _executar(String nomeAudio){
    _audioCache.play(nomeAudio + ".mp3");
  }

  void initState(){
    super.initState();
    _audioCache.loadAll(["1.mp3","2.mp3", "3.mp3", "4.mp3", "5.mp3", "6.mp3"]);
  }

  
  @override
  Widget build(BuildContext context) {

    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.width;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      scrollDirection: Axis.vertical,
      //precisa colocar o onTap na imagem
      children: [
        GestureDetector(
          onTap: (){
            _executar("1");
          },
          child: Image.asset("assets/imagens/1.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("2");
          },
          child: Image.asset("assets/imagens/2.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("3");
          },
          child: Image.asset("assets/imagens/3.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("4");
          },
          child: Image.asset("assets/imagens/4.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("5");
          },
          child: Image.asset("assets/imagens/5.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("6");
          },
          child: Image.asset("assets/imagens/6.png")
        )

      ],
      );
  }
}