import 'package:flutter/material.dart';
import 'package:mvc/alta.dart';
import 'package:mvc/biblioteca.dart';
import 'package:mvc/inicio.dart';
import 'package:mvc/inscricao.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  List<Widget> views = [InicioView(),AltaView(), InscricaoView(), BibliotecaView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: const Text(
          "Minha página", 
          style: TextStyle(color: Colors.black)
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.video_camera_back),
              onPressed: (){
              print("acao: camera");
            }
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){
              print("acao: camera");
            }
            ),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: (){
              print("acao: camera");
            }
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: (){
              print("acao: camera");
            }
            ),
          ]
      ),

      body:views[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        //traz em qual pagina está
        currentIndex: _indiceAtual,
        type: BottomNavigationBarType.shifting,
        fixedColor: Color.fromARGB(255, 17, 53, 35),
        items: [
         BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home),
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot),
            backgroundColor: Color.fromARGB(255, 0, 255, 115),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
            backgroundColor: Colors.redAccent,
          ),
        ],
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        ),
    );
  }
}