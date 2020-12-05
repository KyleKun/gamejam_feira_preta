import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:gamejam/game/utils/constants.dart';

class SmallTable extends GameDecoration {
  SmallTable(Position initPosition)
      : super.sprite(
          Sprite('decoration/small_table.png'),
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
        );

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
