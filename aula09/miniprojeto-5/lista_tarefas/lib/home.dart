import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _taskList = [];
  Map<String, dynamic> _lastRemovedTask = {};
  final TextEditingController _controllerTask = TextEditingController();

  

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  void _saveTask(){
    String inputText = _controllerTask.text;

    Map<String, dynamic> task = Map();

    task['Título'] = inputText;
    task['realizada'] = false;

    setState(() {
      _taskList.add(task);
    });

    _saveFile();
    
    _controllerTask.text = "";

  }

  void _saveFile() async{
    var file = await _getFile();
    
    String data = json.encode(_taskList);

    file.writeAsString(data);
  }

    Future<String?> _readFile() async{
    try{
      final file = await _getFile();
      return file.readAsString();
    } catch(e){
      return null;
    }
  }

  void initState(){
    super.initState();
    _readFile().then(
      (data){
        setState(() {
          if(data != null){
            _taskList = json.decode(data);
          }else{
            _taskList = [];
          }
        });
      }
    );
  }

  Widget createItemList(context, index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()), 
      direction: DismissDirection.endToStart, //a direção do arrastar
      onDismissed: (direction){
        _lastRemovedTask;

        _taskList.removeAt(index);

        _saveFile();

        final snackBar = SnackBar(
          backgroundColor: Colors.deepPurple,
          duration: Duration(seconds: 15),
          content: const Text("Tarefa removida"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: (){
              setState(() {
                _taskList.insert(index, _lastRemovedTask);
              });
              _saveFile();
            },
          )
        );

        ScaffoldMessenger.of(context.showSnackBar(snackBar));
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete, //mostra a lixeira quando arrasta para o lado
              color: Colors.white,)
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(_taskList[index]['Título']),
        value: _taskList[index]['realizada'],
        onChanged: (value){
          setState(() {
            _taskList[index]['realizada'] = value;
          });

          _saveFile();
        },
        )
      );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _taskList.length,
                itemBuilder: createItemList,),
              )
          ]
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.purple,
            onPressed: (){
              showDialog(
                barrierDismissible: false, //não deixa sair da janela clicando fora dela
                context: context, 
                builder: (context){
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
                    content: TextField(
                      controller: _controllerTask,
                      decoration: const InputDecoration(
                        labelText: "Digite sua tarefa",
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text("Cancelar", style: TextStyle(color: Colors.red)),
                        onPressed: (){
                          Navigator.pop(context); //faz fechar a janela ao clicar em cancelar
                        },
                      ),
                      TextButton(
                        child: const Text("Salvar", style: TextStyle(color: Colors.lightBlue)),
                        onPressed: (){
                          _saveTask();
                          Navigator.pop(context); //faz fechar a janela ao clicar em cancelar
                        },
                      )
                    ],
                  );
                }
                );
            },
          ),
    );
  }
}

