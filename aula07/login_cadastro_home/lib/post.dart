class Post{
  //_ é para atributos privados
  int _userId;
  late int _id; //late avisa que é um operdor atrasado, que por enquanto nao tem id, mas assim que receber vai pegar esse valor
  String _title;
  String _body;

  //construtor -> tem o mesmo nome da classe
  //é uma inicialização
  //faz a inserção no bd
  Post(this._userId, this._id, this._title, this._body);
  Post.criar(this._userId, this._title, this._body);

  //getter e setter
  int get userId => _userId;
  set userId(int value){
  _userId = value;
  }

  int get id => _id;
  set id(int value){
  _id = value;
  }

  String get title => _title;
  set title(String value){
  _title = value;
  }

  String get body => _body;
  set body(String value){
  _body = value;
  }

}