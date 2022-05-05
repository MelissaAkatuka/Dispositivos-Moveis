import 'dart:html';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:login_cadastro_home/post.dart';

Future<List<Post>> _recuperarPostagens() async{
  String _urlBase = "https://jsonplaceholder.typicode.com";
  Dio dio = Dio();
  Response response = await dio.get(_urlBase + "/posts");

  List<Post> postagens = [];

  for(var post in response.data){
    Post p = Post(post['userId'], post['id'], post['title'], post['body']);
    postagens.add(p);
  }

  //pegar as postagens mais recentes
  return postagens.reversed.toList();
  
}

Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Text("Lista de Posts"),
    ),
    body: FutureBuilder<List<Post>>(
      future: _recuperarPostagens(),
      builder:(context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          //terminou de receber os dados
          case ConnectionState.done:
          if(snapshot.hasError){
            return Container(
              child: Text("Problema ao carregar Posts"),
            );
          } else{
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                List<Post> lista = snapshot.data!;
                Post post = lista[index];

                return ListTile(
                  title: Text(post.title),
                  subtitle: Text("${post.body.substring(0,30)}..."),
                  leading: Text(post.id.toString()),
                );

              },
              );
            }
          }
        }
    }
    ) 
      ),
  );
}




/*

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    TextEditingController cepController = TextEditingController();
    TextEditingController logradouroController = TextEditingController();
    TextEditingController bairroController = TextEditingController();
    TextEditingController cidadeController = TextEditingController();
    TextEditingController estadoController = TextEditingController();

    //função assícrona
    void _buscarCep() async{
      Dio dio = Dio();

      String urlBase = "https://viacep.com.br/ws/";
      Response response = await dio.get(urlBase + cepController.text + "/json/");

      //se a consulta der certo, vai preencher as informações

      if(response.statusCode == 200){
        setState(() {
          logradouroController.text = response.data['logradouro'];
          bairroController.text = response.data['bairro'];
          cidadeController.text = response.data['localidade'];
          estadoController.text = response.data['uf'];
        });
      }
      }

  @override
  Widget build(BuildContext context) {

    //shift + alt + seta pra baixo

    return Scaffold(
      appBar: AppBar(
        title: Text("CEP"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(controller: cepController,),
              TextButton(onPressed:_buscarCep, child: Text("Buscar")),
              TextFormField(controller: logradouroController),
              TextFormField(controller: bairroController),
              TextFormField(controller: cidadeController),
              TextFormField(controller: estadoController),
            ]),
        ),)
    );
  }
}
*/