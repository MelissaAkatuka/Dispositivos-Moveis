import 'package:flutter/material.dart';
import 'package:projeto5/empresa.dart';
import 'package:projeto5/servicos.dart';
import 'package:projeto5/views/home.dart';

import 'cliente.dart';
import 'contato.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case "/": 
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case "/tela-empresa": 
        return MaterialPageRoute(builder: (_) => EmpresaView());
      case "/tela-servico": 
        return MaterialPageRoute(builder: (_) => ServicoView());
      case "/tela-contato": 
        return MaterialPageRoute(builder: (_) => ContatoView());
      case "/tela-cliente": 
        return MaterialPageRoute(builder: (_) => ClienteView());
      default:
        _erroRota();                        
    }

    throw '';
  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Erro Rota"),
        ),
        body: const Text("Tela não encontrada"),
      );
    });
  }
}