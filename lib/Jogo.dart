
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _pedra = "images/pedra.png";
  var _papel = "images/papel.png";
  var _tesoura = "images/tesoura.png";
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var quantidadeDeOpcoes = 3;
    var numero = Random().nextInt(quantidadeDeOpcoes);
    var escolhaDoApp = opcoes[numero];

    switch(escolhaDoApp){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage(_pedra);
        });
        break;

      case "papel" :
        setState(() {
          this._imagemApp = AssetImage(_papel);
        });
        break;

      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage(_tesoura);
        });
        break;
    }

    if(
        (escolhaUsuario == "pedra" && escolhaDoApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaDoApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaDoApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou: ";
      });

    } else if((escolhaUsuario == "papel" && escolhaDoApp == "tesoura") ||
        (escolhaUsuario == "pedra" && escolhaDoApp == "papel") ||
        (escolhaUsuario == "tesoura" && escolhaDoApp == "pedra")){
      this._mensagem = "Você perdeu :( ";
    } else {
      this._mensagem = "Empate! ";

    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text("Escolha do App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(_pedra, height: 100,)
              ),

              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset(_papel, height: 100,)
              ),

              GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset(_tesoura, height: 100,)
              )
            ],
          )

        ],
      ),
    );
  }
}
