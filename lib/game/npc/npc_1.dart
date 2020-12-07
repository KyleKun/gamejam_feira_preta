import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/map/battle_map.dart';
import 'package:gamejam/game/player/beatriz.dart';
import 'package:gamejam/game/utils/common_spritesheet.dart';
import 'package:gamejam/game/utils/constants.dart';
import 'package:gamejam/game/utils/sound.dart';
import '../utils/change_map.dart';

class NPC1 extends GameDecoration with Sensor {
  bool hasContact = false;
  bool _showConversation = false;
  bool _completedTask = false;
  NPC1(
    Position position,
  ) : super(
          animation: FlameAnimation.Animation.sequenced(
            'npc/npc1.png',
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
        _giveTrashTask();
      }
    }
  }

  void _goToBattle(BuildContext context) {
    {
      Sound.stopBackgroundSound();
      Future.delayed(Duration(milliseconds: (1 * 1000)), () {
        context.goTo(BattleMap(
          position:
              Position((5 * Constants.tileSize), (9 * Constants.tileSize)),
        ));
      });
    }
  }

  @override
  void update(double dt) {
    if ((gameRef.player as Beatriz).taskCount == 3 && !_completedTask) {
      _completedTask = true;
      (gameRef.player as Beatriz).mission1 = 'Falar com Léo';
      Future.delayed(Duration(milliseconds: (10 * 1000)), () {
        _pontoRacista1();
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
          "npc/npc1.png",
          1,
          textureWidth: 160,
          textureHeight: 160,
        ),
      ),
      personDirection: PersonDirection.LEFT,
    );
  }

  void _giveTrashTask() {
    TalkDialog.show(
        gameRef.context,
        [
          talkToPlayer(
              'Beatriz, vou receber clientes importantes hoje, você poderia recolher o lixo mais cedo?'),
          talkToPlayer(
              'Pode pegar só o daqui, o do corredor e o da sala ao lado, por favor.'),
          talkToPlayer(
              'Vou fazer uma ligação agora, volte aqui depois para conversarmos sobre um assunto. Obrigado.'),
        ],
        textStyle: Constants.talkTextStyle, finish: () {
      (gameRef.player as Beatriz).mission1 = ' Coletar lixo';
    });
  }

  void _pontoRacista1() {
    Sound.stopBackgroundSound();
    gameRef.gameCamera.moveToPositionAnimated(
        Position((kIsWeb ? 18 * Constants.tileSize : 18 * Constants.tileSize),
            (8 * Constants.tileSize)),
        zoom: 2, finish: () {
      Future.delayed(Duration(milliseconds: (1 * 1000)), () {
        TalkDialog.show(
            gameRef.context,
            [
              talkToPlayer(
                  '(Ao telefone)\nSim hahahaha, não se preocupe, vou conversar com a Beatriz.'),
              talkToPlayer(
                  'Vou recomendar algumas empresas menores para ela mandar currículo.'),
              talkToPlayer(
                  'Exatamente, a vaga de analista aqui na nossa empresa é muito concorrida.'),
              talkToPlayer(
                  'Apesar de ela parecer esforçada, é necessário encarar a realidade.'),
              talkToPlayer(
                  'Como um bom líder, é meu papel deixar bem claro os fatos, até mesmo se for para o pessoal da limpeza.'),
              talkToPlayer(
                  'O quê? Você ficou sabendo que aparentemente ela tirou você no amigo secreto?'),
              talkToPlayer(
                  'Bom, você disse que precisava de uma vassoura nova mesmo, não? Hahahahahahahhaha.'),
            ],
            textStyle: Constants.talkTextStyle, finish: () {
          gameRef.gameCamera.moveToPlayerAnimated();
          Future.delayed(Duration(milliseconds: (2 * 1000)), () {
            (gameRef.player as Beatriz).sofreu = true;
          });
          Future.delayed(Duration(milliseconds: (3 * 1000)), () {
            _goToBattle(gameRef.context);
          });
        });
      });
    });
  }
}
