import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/map/3battle_map.dart';
import 'package:gamejam/game/map/battle_map.dart';
import 'package:gamejam/game/player/beatriz.dart';
import 'package:gamejam/game/utils/common_spritesheet.dart';
import 'package:gamejam/game/utils/constants.dart';
import 'package:gamejam/game/utils/sound.dart';
import '../utils/change_map.dart';

class NPC3 extends GameDecoration with Sensor {
  bool hasContact = false;
  bool _showConversation = false;
  bool _completedTask = false;
  NPC3(
    Position position,
  ) : super(
          animation: FlameAnimation.Animation.sequenced(
            'npc/npc3.png',
            2,
            amountPerRow: 1,
            textureWidth: 160,
            textureHeight: 160,
            stepTime: 1.0,
          ),
          initPosition: position,
          width: Constants.tileSize * 1.3,
          height: Constants.tileSize * 1.3,
          collision: Collision(
            width: Constants.tileSize * 0.8,
            height: Constants.tileSize,
            align: Offset(
              Constants.tileSize * 0.2,
              0,
            ),
          ),
        );

  @override
  void onContact(collision) {
    if (!hasContact && collision is Player) {
      hasContact = true;
      if (!_showConversation) {
        _showConversation = true;
        _givePaperTask();
      }
    }
  }

  void _goToBattle(BuildContext context) {
    {
      Sound.stopBackgroundSound();
      Future.delayed(Duration(milliseconds: (1 * 1000)), () {
        context.goTo(BattleMap3(
          position:
              Position((5 * Constants.tileSize), (9 * Constants.tileSize)),
        ));
      });
    }
  }

  @override
  void update(double dt) {
    if ((gameRef.player as Beatriz).taskCount == 1 && !_completedTask) {
      _completedTask = true;
      Future.delayed(Duration(milliseconds: (10 * 1000)), () {
        _pontoRacista3();
      });
    }

    super.update(dt);
  }

  Say talkToPlayer(phrase) {
    return Say(
      phrase,
      Flame.util.animationAsWidget(
        Position(80, 100),
        FlameAnimation.Animation.sequenced(
          "npc/npc3.png",
          1,
          textureWidth: 160,
          textureHeight: 160,
        ),
      ),
      personDirection: PersonDirection.LEFT,
    );
  }

  void _givePaperTask() {
    TalkDialog.show(
        gameRef.context,
        [
          talkToPlayer(
              'Opa, chegou em bom momento, poderia pegar esse papel atrás de mim?'),
          talkToPlayer('Acabou de cair e minhas costas estão me matando...'),
          talkToPlayer('É só colocar em cima daquela mesa.'),
        ],
        textStyle: Constants.talkTextStyle, finish: () {
      (gameRef.player as Beatriz).mission3 = ' Pegar Papel';
      Future.delayed(Duration(milliseconds: (2 * 1000)), () {
        (gameRef.player as Beatriz).taskCount += 1;
      });
    });
  }

  void _pontoRacista3() {
    Sound.stopBackgroundSound();
    TalkDialog.show(
        gameRef.context,
        [
          talkToPlayer('Viu?!'),
          talkToPlayer('Esse é o tipo de tarefa que você nasceu para fazer.'),
          talkToPlayer(
              'Não sei como consegui chegar à um cargo de gestão, mas você não tem chances contra alguém como eu.'),
          talkToPlayer(
              'Seu currículo é uma piada comparado ao de muitos outros aqui.'),
          talkToPlayer('Não existem CEOs vindos da favela assim como você.'),
          talkToPlayer(
              'Coloque-se no seu lugar e se contente com o cargo atual. Você já ganha até demais.'),
        ],
        textStyle: Constants.talkTextStyle, finish: () {
      Future.delayed(Duration(milliseconds: (2 * 1000)), () {
        (gameRef.player as Beatriz).sofreu = true;
      });
      Future.delayed(Duration(milliseconds: (3 * 1000)), () {
        _goToBattle(gameRef.context);
      });
    });
  }
}
