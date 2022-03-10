import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "AULA 02",
    home: HomeEstado(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeEstado extends StatefulWidget {
  const HomeEstado({Key? key}) : super(key: key);

  @override
  _HomeEstadoState createState() => _HomeEstadoState();
}

class _HomeEstadoState extends State {
  String nome = "Melissa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        color: Colors.lime,
        child: Column(children: [
          Text(nome),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.limeAccent,
          elevation: 20,
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Botão"),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            nome = "SASAGEYO";
          });
        },
        child: Text("+"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  String nome = "Melissa";
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          )
        ],
// leading: Text('OI'),
      ),
      body: Container(
        color: Colors.lime,
        child: Column(children: [
          Text("Texto"),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.limeAccent,
          elevation: 20,
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Botão"),
              )
            ],
          )),
    );
  }
}
