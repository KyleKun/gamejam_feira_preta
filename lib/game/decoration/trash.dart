import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:gamejam/game/player/faxineira.dart';
import 'package:gamejam/game/utils/constants.dart';

class Trash extends GameDecoration with Sensor {
  bool hasContact = false;
  Trash(Position initPosition)
      : super.sprite(
          null,
          initPosition: initPosition,
          width: Constants.tileSize,
          height: Constants.tileSize,
          collision: Collision(
            width: Constants.tileSize,
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

  @override
  void onContact(collision) {
    if (!hasContact && collision is Player) {
      hasContact = true;
      (gameRef.player as Faxineira).trashCount += 1;
    }
  }
}
