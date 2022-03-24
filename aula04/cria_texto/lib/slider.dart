import 'package:flutter/material.dart';

class SliderButtonState extends StatefulWidget {
  const SliderButtonState({ Key? key }) : super(key: key);

  @override
  _SliderButtonStateState createState() => _SliderButtonStateState();
}

class _SliderButtonStateState extends State<SliderButtonState> {

  double _valorSlider = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Slider(
            min: 0,
            max: 10,
            divisions: 10,
            value: _valorSlider, 
            onChanged: (valor){
              setState(() {
                _valorSlider = valor;
              });
            }),
          ElevatedButton(
            onPressed: (){
              print("SLIDER: $_valorSlider");
            }, 
            child: const Text("Clicar"))
        ],)
    );
  }
}