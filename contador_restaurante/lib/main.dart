import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const int _quantMaximaPessoas = 20;
  int _pessoa = 0;
  String _mensagem = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= _quantMaximaPessoas) {
        _mensagem = "Lotado, não pode entrar!";
        _pessoa = _quantMaximaPessoas;
      } else if (_pessoa >= 0 && _pessoa < _quantMaximaPessoas) {
        _mensagem = "Pode entrar!";
      } else {
        _pessoa = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, 
      children: <Widget>[
        Image.asset("imagens/restaurante.jpg", fit: BoxFit.cover, height: 1000.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[
            Text(
              "Pessoas: $_pessoa",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("+1", style: TextStyle(fontSize: 40.0, color: Colors.white)
                  ),
                  onPressed: () {
                    _changePeople(1);
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text("-1", style: TextStyle(fontSize: 40.0, color: Colors.white)
                  ),
                  onPressed: () {
                    _changePeople(-1);
                  }
                ),
              )
            ],
          ),
          Text(
            _mensagem,
            style: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic, color: Colors.white,
            decoration: TextDecoration.none,),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ]
  );
}

}
