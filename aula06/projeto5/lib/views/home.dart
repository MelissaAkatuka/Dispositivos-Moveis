import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("ATM Consultoria"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Image.asset('lib/assets/images/logo.png'),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  focusColor: Colors.white,
                  onTap:(){
                    Navigator.pushNamed(context, "/tela-empresa");
                  },
                  child: Image.asset('lib/assets/images/menu_empresa.png'),
                ),
                InkWell(
                  focusColor: Colors.white,
                  onTap:(){
                    Navigator.pushNamed(context, "/tela-servico");
                  },
                  child: Image.asset('lib/assets/images/menu_servico.png'),
                ),
              ],
              ),
              const SizedBox(
                height: 32,
              ),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  focusColor: Colors.white,
                  onTap:(){
                    Navigator.pushNamed(context, "/tela-cliente");
                  },
                  child: Image.asset('lib/assets/images/menu_cliente.png'),
                ),
                InkWell(
                  focusColor: Colors.white,
                  onTap:(){
                    Navigator.pushNamed(context, "/tela-contato");
                  },
                  child: Image.asset('lib/assets/images/menu_contato.png'),
                )
              ],
              ),
          ],
        ),
      ),
    );
  }
}