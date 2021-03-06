import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamejam/game/map/office_map.dart';
import 'package:gamejam/game/utils/common_spritesheet.dart';
import 'package:gamejam/game/utils/constants.dart';
import 'package:gamejam/game/utils/player_spritesheet.dart';
import '../utils/change_map.dart';
import 'package:gamejam/game/utils/sound.dart';

class Beatriz extends SimplePlayer with Lighting {
  final Position initPosition;
  final int phase;
  double attack = 20;
  double stamina = 100;
  double initSpeed = Constants.tileSize * 3;
  IntervalTick _timerStamina = IntervalTick(250);
  IntervalTick _timerAttackRange = IntervalTick(100);
  IntervalTick _timerSeeEnemy = IntervalTick(500);
  bool showObserveEnemy = false;
  bool showTalk = false;
  double angleRadAttack = 0.0;
  Rect rectDirectionAttack;
  Sprite spriteDirectionAttack;
  bool showDirection = false;

  bool sofreu = false;

  int killScore = 0;
  int taskCount = 0;

  String mission1 = 'Falar com Léo';
  String level1 = 'Cargo: Faxineira';

  String mission2 = ' Tirar Cópias';
  String level2 = 'Cargo: Analista';

  String mission3 = 'Falar com Ivo';
  String level3 = 'Cargo: Gestora';
  String level4 = 'Cargo: CEO';

  Beatriz(this.initPosition, this.phase)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          width: Constants.tileSize * 1.2,
          height: Constants.tileSize * 1.2,
          initPosition: initPosition,
          life: 200,
          speed: Constants.tileSize * 3,
          collision: Collision(
            height: Constants.tileSize / 2,
            width: Constants.tileSize / 1.8,
            align: Offset(Constants.tileSize / 3.5, Constants.tileSize / 2),
          ),
        ) {
    spriteDirectionAttack = Sprite('direction_attack.png');
    lightingConfig = LightingConfig(
      radius: width * 1.5,
      blurBorder: width * 1.5,
    );
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    this.speed = initSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead) return;

    if (gameRef.joystickController.keyboardEnable) {
      if (event.id == LogicalKeyboardKey.space.keyId) {
        Sound.attackPlayerMelee();
        actionAttack();
      }
    }

    if (event.id == 0 && event.event == ActionEvent.DOWN) {
      Sound.attackPlayerMelee();
      actionAttack();
    }

    if (event.id == 1) {
      if (event.event == ActionEvent.MOVE) {
        showDirection = true;
        angleRadAttack = event.radAngle;
        if (_timerAttackRange.update(dtUpdate)) actionAttackRange();
      }
      if (event.event == ActionEvent.UP) {
        showDirection = false;
        actionAttackRange();
      }
    }

    super.joystickAction(event);
  }

  @override
  void die() {
    remove();
    gameRef.addGameComponent(
      GameDecoration(
        initPosition: Position(
          position.left,
          position.top,
        ),
        height: Constants.tileSize,
        width: Constants.tileSize,
        sprite: Sprite('player/crypt.png'),
      ),
    );
    Sound.stopBackgroundSound();
    Future.delayed(Duration(milliseconds: (2 * 1000)), () {
      gameRef.context.goTo(
        OfficeMap(
          position: Position(
            (16 * Constants.tileSize),
            (4 * Constants.tileSize),
          ),
        ),
      );
    });
    super.die();
  }

  void actionAttack() {
    if (stamina < 15) return;

    decrementStamina(15);
    this.simpleAttackMelee(
      damage: attack,
      animationBottom: CommonSpriteSheet.whiteAttackEffectBottom,
      animationLeft: CommonSpriteSheet.whiteAttackEffectLeft,
      animationRight: CommonSpriteSheet.whiteAttackEffectRight,
      animationTop: CommonSpriteSheet.whiteAttackEffectTop,
      heightArea: Constants.tileSize,
      widthArea: Constants.tileSize,
    );
  }

  void actionAttackRange() {
    if (stamina < 10) return;

    Sound.attackRange();
    decrementStamina(10);
    this.simpleAttackRangeByAngle(
      id: {'ddd': 'kkkkk'},
      animationTop: CommonSpriteSheet.vassouraTop,
      animationDestroy: CommonSpriteSheet.explosionAnimation,
      radAngleDirection: angleRadAttack,
      destroy: () => Sound.explosion(),
      width: width * 0.7,
      height: width * 0.7,
      damage: 10,
      speed: initSpeed * 2,
      collision: Collision(
        width: width / 2,
        height: width / 2,
        align: Offset(width * 0.1, 0),
      ),
      lightingConfig: LightingConfig(
        radius: width * 0.5,
        blurBorder: width,
      ),
    );
  }

  @override
  void update(double dt) {
    if (this.isDead || gameRef?.size == null) return;
    _verifyStamina(dt);

    if (this.sofreu == true) {
      this.sofreu = false;
      showEmote();
    }

    if (_timerSeeEnemy.update(dt) && !showObserveEnemy) {
      this.seeEnemy(
        radiusVision: width * 5,
        notObserved: () {
          showObserveEnemy = false;
        },
        observed: (enemies) {
          showObserveEnemy = true;
          showEmote();
          if (!showTalk) {
            showTalk = true;
            switch (phase) {
              case 1:
                _showTalk1(enemies.first);
                break;
              case 2:
                _showTalk2(enemies.first);
                break;
              case 3:
                _showTalk3(enemies.first);
                break;
              default:
                print('quebrou');
            }
          }
        },
      );
    }
    super.update(dt);
  }

  @override
  void render(Canvas c) {
    _drawDirectionAttack(c);
    super.render(c);
  }

  void _verifyStamina(double dt) {
    if (_timerStamina.update(dt) && stamina < 100) {
      stamina += 2;
      if (stamina > 100) {
        stamina = 100;
      }
    }
  }

  void decrementStamina(int i) {
    stamina -= i;
    if (stamina < 0) {
      stamina = 0;
    }
  }

  @override
  void receiveDamage(double damage, dynamic from) {
    this.showDamage(damage,
        config: TextConfig(
          fontSize: width / 3,
          color: Colors.red,
        ));
    Sound.attackEnemyMelee();
    super.receiveDamage(damage, from);
  }

  void showEmote() {
    gameRef.add(
      AnimatedFollowerObject(
        animation: CommonSpriteSheet.emote,
        target: this,
        positionFromTarget: Rect.fromLTWH(18, -6, width / 2, height / 2),
      ),
    );
  }

  Say _say(String text) {
    return Say(
      text,
      Container(
        width: 50,
        height: 50,
        child: AnimationWidget(
          animation: animation.current,
          playing: true,
        ),
      ),
    );
  }

  void _showTalk3(Enemy first) {
    gameRef.pause();
    TalkDialog.show(
        gameRef.context,
        [
          _say('Acredito que eu finalmente entendi do que isso se trata...'),
          _say(
              'Esses monstros são como se fossem uma representação dos sentimentos racistas das pessoas.'),
          _say(
              'Mas não importa o que aconteça, nada irá me impedir de alcançar a Presidência!'),
          _say(
              'Irei provar meu valor para o mundo e inspirar o maior número de pessoas possível.'),
          _say(
              'A mudança necessita de ação. E afinal de contas, se não for eu, quem será?'),
          _say('Venham, monstros. Vou lhes ensinar como se brinca.'),
        ],
        textStyle: Constants.talkTextStyle, finish: () {
      gameRef.resume();
    });
  }

  void _showTalk2(Enemy first) {
    gameRef.pause();
    TalkDialog.show(
        gameRef.context,
        [
          _say('Então vim parar aqui de novo...'),
          _say(
              'Aparentemente eles estão um pouco mais fortes que dá última vez.'),
          _say('Vamos lá, você consegue Beatriz!')
        ],
        textStyle: Constants.talkTextStyle, finish: () {
      gameRef.resume();
    });
  }

  void _showTalk1(Enemy first) {
    TalkDialog.show(
        gameRef.context,
        [
          _say('Onde estou?'),
          _say('Esse lugar não parece nada amigável...'),
          _say('MEU DEUS! O QUE É AQUILO?!')
        ],
        textStyle: Constants.talkTextStyle, finish: () {
      gameRef.gameCamera.moveToTargetAnimated(first, zoom: 2, finish: () {
        Future.delayed(Duration(milliseconds: (1 * 1000)), () {
          TalkDialog.show(
              gameRef.context,
              [
                _say('Eu nunca vi um monstro tão feio na vida...'),
                _say(
                    'Logo quando eu acabei de ouvir algo horrível, vim parar aqui...'),
                _say('Ainda bem que eu trouxe minha vassoura!')
              ],
              textStyle: Constants.talkTextStyle, finish: () {
            gameRef.gameCamera.moveToPlayerAnimated();
          });
        });
      });
    });
  }

  void _drawDirectionAttack(Canvas c) {
    if (showDirection) {
      double radius = position.height;
      rectDirectionAttack = Rect.fromLTWH(position.center.dx - radius,
          position.center.dy - radius, radius * 2, radius * 2);
      renderSpriteByRadAngle(
        c,
        angleRadAttack,
        rectDirectionAttack,
        spriteDirectionAttack,
      );
    }
  }
}
