import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      child: Center(
          child: Text(
        'Você venceu o jogo!\nObrigado por jogar!',
        style:
            TextStyle(color: Colors.green, fontFamily: 'Pixel', fontSize: 72.0),
      )),
    ));
  }
}
