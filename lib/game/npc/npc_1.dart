import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flutter/material.dart';
import 'package:gamejam/game/map/battle_map.dart';
import 'package:gamejam/game/player/faxineira.dart';
import 'package:gamejam/game/utils/constants.dart';
import '../utils/change_map.dart';

class NPC1 extends GameDecoration with Sensor {
  bool hasContact = false;
  bool _showConversation = false;
  NPC1(
    Position position,
  ) : super(
          animation: FlameAnimation.Animation.sequenced(
            "npc/prince_idle.png",
            2,
            textureWidth: 32,
            textureHeight: 32,
            stepTime: 0.8,
          ),
          initPosition: position,
          width: 54,
          height: 54,
        );

  @override
  void onContact(collision) {
    if (!hasContact && collision is Player) {
      hasContact = true;
      if (!_showConversation) {
        _showConversation = true;
        _giveTrashTask();
      }
    }
  }

  void _goToBattle(BuildContext context) {
    {
      context.goTo(BattleMap(
        position: Position((5 * Constants.tileSize), (9 * Constants.tileSize)),
      ));
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  Say talkToPlayer(phrase) {
    return Say(
      phrase,
      Flame.util.animationAsWidget(
        Position(80, 100),
        FlameAnimation.Animation.sequenced(
          "npc/prince_idle.png",
          4,
          textureWidth: 32,
          textureHeight: 32,
        ),
      ),
      personDirection: PersonDirection.LEFT,
    );
  }

  void _giveTrashTask() {
    TalkDialog.show(gameRef.context, [
      talkToPlayer('prince_a'),
      talkToPlayer('prince_b'),
      talkToPlayer('prince_c'),
      talkToPlayer('prince_d'),
      talkToPlayer('prince_e'),
      talkToPlayer('prince_f'),
      talkToPlayer('prince_g'),
      talkToPlayer('prince_h'),
      talkToPlayer('prince_i'),
      talkToPlayer('prince_j'),
    ], finish: () {
      _goToBattle(gameRef.context);
    });
  }
}
