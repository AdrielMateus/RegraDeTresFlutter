import 'package:flutter/material.dart';
import 'dart:core';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(MaterialApp(
    home: RegraDeTres(),
    debugShowCheckedModeBanner: false,
  ));
}

class RegraDeTres extends StatefulWidget {
  
  @override
  _RegraDeTresState createState() => _RegraDeTresState();
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController numUmController = TextEditingController();
  TextEditingController numDoisController = TextEditingController();
  TextEditingController numTresController = TextEditingController();

  String _tutorial1="⇧\nPressione o botão ? \npara ver um exemplo ";
  String _tutorial2="Pressione o botão ⊗ \nvermelho para limpar \n⇩   \n\n\n";
  String _campo1="";
  String _campo2="";
  String _campo3="";
  String _delta = "";
  String _textoInicio="";
  
class _RegraDeTresState extends State<RegraDeTres> {

  void _limpaCampos(){
      setState(() {
      numUmController.text = "";
      numDoisController.text = "";
      numTresController.text = "";
      _delta = "";
      _campo1 = "";
      _campo2 = "";
      _campo3 = "";
      _textoInicio="";
      _tutorial1="\n";
      _tutorial2="";
      
    });
  }
  void _exemplo(){
      setState(() {
      numUmController.text = "200000";
      numDoisController.text = "100";
      numTresController.text = "3000";
      _delta = "1.5";
      _textoInicio="Exemplo:\nTenho uma ordem de produção de 200.000 comprimidos. Durante o processo produtivo ouve uma perda de 3.000 comprimdos. Qual foi a perda, em %, desta produção?\n\n   200.000 comprimidos → 100%\n3.000 comprimidos → X\n";
      _campo1 = "\n↓↓↓\n";
      _campo2 = "X=(3000*100)/200000=1.50000\nA perda desta produção foi 1,5%\n";
      _campo3 = "﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀\n\nDiretamente proporcional\nou\nInversamente proporcional\n\nQuando os valores das duas grandezas aumentam ou diminuem podemos afirmar que elas são grandezas diretamente proporcionais.\nQuando o valor de uma grandeza aumenta enquanto a outra diminui podemos afirmar que elas são grandezas inversamente proporcionais.\n\n﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀﹀";
      _tutorial1="";
      //_tutorial2="";
      });
  }
  // "Exemplo\nTenho uma ordem de produção de 200.000 comprimidos. Durante o processo produtivo ouve uma perda de 3.000 comprimdos. Qual foi a perda, em % desta produção?"
  void calcular1(){
  setState(() {
    double a = double.parse(numUmController.text);
    double b = double.parse(numDoisController.text);
    double c = double.parse(numTresController.text);
    double d = 0;
  
    d = b * c / a;
          _delta = d.toStringAsPrecision(2);
          _campo1 = "\n↓↓↓\n";
          _campo2 = "X=(${c.toStringAsFixed(0)}*${b.toStringAsFixed(0)})/${a.toStringAsFixed(0)}=${d.toStringAsFixed(7)}";
          _tutorial1="";
          //_tutorial2="";
    });

  }
  void calcular2(){
  setState(() {
    double a = double.parse(numUmController.text);
    double b = double.parse(numDoisController.text);
    double c = double.parse(numTresController.text);
    double d = 0;
  
    d = b * a / c;
          _delta = d.toStringAsPrecision(2);
          _campo1 = "\n↓↓↓\n";
          _campo2 = "X=(${a.toStringAsFixed(0)}*${b.toStringAsFixed(0)})/${c.toStringAsFixed(0)}=${d.toStringAsFixed(7)}";
          _tutorial1="";
          //_tutorial2="";
    });
  }

void _showDialog() {
    Widget closedButton = FlatButton(
    child: Text("Fechar"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget emailButton = FlatButton(
    child: Text("Enviar e-mail"),
    onPressed:  () {
      launch("mailto:adriel.fredrich@gmail.com?subject=News&body=New%20plugin");
    }
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Sobre"),    
    content: Text("Desenvolvido por: Adriel Fredrich"),
    actions: [
      closedButton,
     emailButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regra de três"),
        centerTitle: true,
        actions: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.info_outlined,
              ),
              alignment: Alignment.centerLeft,
              onPressed: _showDialog,
            ),
            IconButton(
              icon: Icon(
                  Icons.help_outline,
              ),
              onPressed: _exemplo,
            ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _limpaCampos,
        child: Icon(Icons.clear),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 10.0),
        child: Form(
            key: _formKey,
            
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _tutorial1,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  height: 1,
              ),
            ),
            Container(
              width: 100,
              height: 190,
              child: Image.asset('assets/imagens/RegraDeTresIcone.png'),
            ),
            Text(
              _textoInicio,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  height: 1.3,
              ),
            ),        
        

        Row(children: [
          Expanded(
            child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'a',
                      labelText: "Se",
                      labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                      )
                  ),
                  textAlign: TextAlign.center,                  
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                  ),
                  controller: numUmController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Insira o numero";
                    }
                  },
                ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'b',
                      labelText: "Equivale a",
                      labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                      )
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                  ),
                  controller: numDoisController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Insira o numero";
                    }
                  },
                ),
          )
        ]),

        Row(children: [
          Expanded(
            child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'c',
                      labelText: "Então",
                      labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                      )
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                  ),
                  controller: numTresController,
                  validator: (value) {
                    if(value.isEmpty){
                      return "Insira o numero";
                    }
                  },
                ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'x',
                      labelText: "Equivale a",
                      labelStyle: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                      )
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                  ),
                  controller: TextEditingController()..text = _delta,
                  //enabled: false, 
                  readOnly: true,
                ),
          )
        ]),
                  
        Row(children: [
          Expanded(
            child: RaisedButton(
            onPressed: () {
              if(_formKey.currentState.validate()){
              calcular2();
              }
            },
            child: Text(
              "Inversa",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            color: Colors.deepOrangeAccent,
             elevation: 15,
          ),
          ),
          SizedBox(
            width: 22,
            height: 76,
          ),
          new SizedBox(
              width: 260.0,
              child: new RaisedButton(              
              onPressed: () {
                if(_formKey.currentState.validate()){
                calcular1();
              }
            },
            child: Text(
              "Direta",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                height: 1.2,
              ),
            ),
            color: Colors.blue,
             elevation: 15,
          ),
          ),          
        ]),

          Text(
            _campo1,
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.black87,
            fontSize: 23.0,
            height: 1,
            ),
          ),
          Text(
            _campo2,
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.black54,
            fontSize: 23,
            height: 1,
            ),
          ),
          Text(
            _campo3,
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            height: 1,
            ),
          ),
          Text(
            _tutorial2,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                height: 1,
            ),
          ),
          Text(
            "\n",
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.black,
            fontSize: 10.0,
            height: 1,
            ),
          ),
            ]
          )
        )
      ),
    );
  }
}