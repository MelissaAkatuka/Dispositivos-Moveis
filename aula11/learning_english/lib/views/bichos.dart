import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Bichos extends StatefulWidget {
  const Bichos({ Key? key }) : super(key: key);

  @override
  _BichosState createState() => _BichosState();
}

class _BichosState extends State<Bichos> {

  AudioCache _audioCache = AudioCache(prefix: "assets/audios/");

  _executar(String nomeAudio){
    _audioCache.play(nomeAudio + ".mp3");
  }

  void initState(){
    super.initState();
    _audioCache.loadAll(["cao.mp3","gato.mp3", "leao.mp3", "macaco.mp3", "ovelha.mp3", "vaca.mp3"]);
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
            _executar("cao");
          },
          child: Image.asset("assets/imagens/cao.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("gato");
          },
          child: Image.asset("assets/imagens/gato.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("leao");
          },
          child: Image.asset("assets/imagens/leao.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("macaco");
          },
          child: Image.asset("assets/imagens/macaco.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("ovelha");
          },
          child: Image.asset("assets/imagens/ovelha.png")
        ),
        GestureDetector(
          onTap: (){
            _executar("vaca");
          },
          child: Image.asset("assets/imagens/vaca.png")
        )

      ],
      );
  }
}