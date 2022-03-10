import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Hello",
    home: Scaffold(
      appBar: AppBar(
        title: Text("MyApp<3"),
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0,
        actions:[
          IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.logout,
              ),
            ),
        ],
        leading: Text("CANTO"),
        ),
        body: Container(
          color: Colors.greenAccent,
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Text("t1"),
            Text("t2"),
            Text("t3"),
          ]),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: Row(
            children: [
              TextButton(
                onPressed: (){}, 
                child: Text("BTN1"),
                ),
          ],),
         ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}