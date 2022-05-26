import 'package:flutter/material.dart';
import 'package:idb_sqflite/idb_sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    //_recuperarBancoDados() async{
    //   final caminhoBancoDados = await getDatabasesPath();
    //   final localBancoDados = join(caminhoBancoDados, "banco.db");

    //   var retorno = await openDatabase(
    //     localBancoDados,
    //     version: 1,
    //     onCreate: (db, dVersaoRecente){
    //       String sql = 
    //       "CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
    //       db.execute(sql);
    //     },
    //   );
    //   print("aberto: " + retorno.isOpen.toString());

    // }
    _recuperarBancoDados() async {
      var factory = getIdbFactorySqflite(databaseFactoryFfi);
      var storeName = 'records';

      var db = await factory.open('my_records.db', version: 1,
        onUpgradeNeeded: (VersionChangeEvent event) {
      var db = event.database;
      // create the store
      db.createObjectStore(storeName, autoIncrement: true);
    });

    print("aberto " + db.name);

    }

    

    @override
    Widget build(BuildContext context) {
      return Container(
        
      );
    }
}