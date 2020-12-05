import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:gamejam/game/utils/constants.dart';

class BigTable extends GameDecoration {
  BigTable(Position initPosition)
      : super.sprite(
          Sprite('decoration/big_table.png'),
          initPosition: initPosition,
          width: Constants.tileSize * 2,
          height: Constants.tileSize,
          collision: Collision(
            width: Constants.tileSize * 2,
            height: Constants.tileSize * 1.4,
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
