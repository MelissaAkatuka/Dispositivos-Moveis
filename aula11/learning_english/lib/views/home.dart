import 'package:flutter/material.dart';
import 'package:learning_english/views/bichos.dart';
import 'package:learning_english/views/numeros.dart';
import 'package:learning_english/views/vogais.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController; //late avisa que vai receber a inicialização depois

  void initState(){
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      );
  }

  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aprenda Inglês"),
        bottom: TabBar(
          controller: _tabController,

          indicatorWeight: 4,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        
          tabs: [
            Tab(
              text: "Bichos",
            ),
            Tab(
              text: "Números",
            ),
            Tab(
              text: "Vogais",
            ),
        ],
        ),
        ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Bichos(),
              Numeros(),
              Vogais(),
            ],
           )
    );
  }
}