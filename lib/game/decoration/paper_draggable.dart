import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/utils/constants.dart';

class PaperDraggable extends GameDecoration with DragGesture {
  TextConfig _textConfig;
  PaperDraggable(Position initPosition)
      : super.sprite(
          Sprite('decoration/paper.png'),
          initPosition: initPosition,
          width: Constants.tileSize,
          height: Constants.tileSize,
          collision: Collision(
            width: Constants.tileSize * 0.6,
            height: Constants.tileSize * 0.8,
            align: Offset(
              Constants.tileSize * 0.2,
              0,
            ),
          ),
        ) {
    _textConfig = TextConfig(color: Colors.white, fontSize: width / 4);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _textConfig.render(
      canvas,
      'Arraste',
      Position(this.position.left + width / 5, this.position.top - width / 3),
    );
  }
}
