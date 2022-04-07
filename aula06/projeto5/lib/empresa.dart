import 'package:flutter/material.dart';

class EmpresaView extends StatelessWidget {
  const EmpresaView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Empresa"),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('lib/assets/images/detalhe_empresa.png'),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a empresa",
                      style:TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Praesent facilisis quam ut orci lacinia, at euismod sapien vulputate. Proin nec urna vel enim mattis ultrices. Quisque malesuada tincidunt ante, quis tempus lacus dictum porta. Sed ut sapien egestas, porttitor lectus ut, rhoncus magna. Fusce mollis mattis interdum. Nunc pulvinar nisi sit amet tincidunt ullamcorper. Nulla volutpat, magna ac volutpat venenatis, leo magna sollicitudin est, id hendrerit felis mauris eget dolor. Mauris tempor, leo vel sollicitudin ultricies, sapien ante elementum velit, a condimentum risus sapien vel nibh. Ut cursus nisi sed mauris vehicula, non rhoncus enim imperdiet. Donec varius sapien purus, commodo consectetur ex lacinia at. Maecenas tortor leo, aliquet ut massa eget, eleifend tempus nulla. In quis felis vestibulum, imperdiet magna a, semper turpis. Sed ut eros eu ex faucibus scelerisque. Duis aliquet tempor lorem. Donec neque dolor, accumsan in magna vitae, rhoncus placerat arcu. Ut luctus vel odio bibendum viverra."),
            ]),
        )
        ),
    );
  }
}