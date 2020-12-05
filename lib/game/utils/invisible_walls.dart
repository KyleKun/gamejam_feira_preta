import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:gamejam/game/utils/constants.dart';

class HorizontalInvisibleWall extends GameDecoration {
  HorizontalInvisibleWall(Position initPosition)
      : super.sprite(
          null,
          initPosition: initPosition,
          width: Constants.tileSize * 300,
          height: Constants.tileSize,
          collision: Collision(
            width: Constants.tileSize * 300,
            height: Constants.tileSize,
            align: Offset(
              Constants.tileSize * 0.1,
              0,
            ),
          ),
        );

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}

class VerticalInvisibleWall extends GameDecoration {
  VerticalInvisibleWall(Position initPosition)
      : super.sprite(
          null,
          initPosition: initPosition,
          width: Constants.tileSize,
          height: Constants.tileSize * 300,
          collision: Collision(
            width: Constants.tileSize,
            height: Constants.tileSize * 300,
            align: Offset(
              Constants.tileSize * 0.1,
              0,
            ),
          ),
        );

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
