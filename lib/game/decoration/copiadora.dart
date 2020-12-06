import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/player/beatriz.dart';
import 'package:gamejam/game/utils/constants.dart';
import 'package:gamejam/game/utils/sound.dart';

class Copiadora extends GameDecoration with TapGesture {
  TextConfig _textConfig;
  Copiadora(Position initPosition)
      : super.sprite(Sprite('decoration/copiadora.png'),
            initPosition: initPosition,
            width: 40,
            height: 80,
            collision: Collision(
              width: Constants.tileSize,
              height: Constants.tileSize * 1.4,
              align: Offset(
                Constants.tileSize * 0.1,
                0,
              ),
            )) {
    _textConfig = TextConfig(
        color: Colors.black, fontFamily: 'Pixel', fontSize: width / 2);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _textConfig.render(
      canvas,
      'Clique',
      Position(this.position.left + width / 5, this.position.top - width / 2),
    );
  }

  @override
  void onTap() {
    Sound.bip();
    if ((gameRef.player as Beatriz).taskCount < 50) {
      (gameRef.player as Beatriz).taskCount += 1;
    }
  }
}
