import 'package:bonfire/bonfire.dart';
import 'package:flame/position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/player/faxineira.dart';
import 'package:gamejam/game/utils/common_spritesheet.dart';
import 'package:gamejam/game/utils/constants.dart';
import 'package:gamejam/game/utils/enemy_spritesheet.dart';
import 'package:gamejam/game/utils/sound.dart';

class CommonEnemy extends SimpleEnemy {
  double attack = 20;

  CommonEnemy(Position initPosition)
      : super(
            animation: EnemySpriteSheet.simpleDirectionAnimation,
            initPosition: initPosition,
            width: Constants.tileSize * 0.8,
            height: Constants.tileSize * 0.8,
            speed: Constants.tileSize * 1.6,
            life: 100,
            collision: Collision(
                height: Constants.tileSize * 0.4,
                width: Constants.tileSize * 0.4,
                align: Offset(
                  Constants.tileSize * 0.2,
                  Constants.tileSize * 0.4,
                )));

  @override
  void update(double dt) {
    super.update(dt);
    if (this.isDead) return;

    this.seePlayer(
      observed: (player) {
        this.seeAndMoveToPlayer(
          closePlayer: (player) {
            execAttack();
          },
          radiusVision: Constants.tileSize * 2.5,
        );
      },
      radiusVision: Constants.tileSize * 2.5,
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    this.drawDefaultLifeBar(canvas);
  }

  @override
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
      ),
    );
    gameRef.add(CommonEnemy(
        Position((5.5 * Constants.tileSize), (3.8 * Constants.tileSize))));
    (gameRef.player as Faxineira).score += 1;
    remove();
    super.die();
  }

  void execAttack() {
    if (gameRef.player != null && gameRef.player.isDead) return;
    Sound.attackEnemyMelee();
    this.simpleAttackMelee(
      heightArea: width,
      widthArea: width,
      damage: attack / 2,
      interval: 400,
      attackEffectBottomAnim: CommonSpriteSheet.blackAttackEffectBottom,
      attackEffectLeftAnim: CommonSpriteSheet.blackAttackEffectLeft,
      attackEffectRightAnim: CommonSpriteSheet.blackAttackEffectRight,
      attackEffectTopAnim: CommonSpriteSheet.blackAttackEffectTop,
    );
  }

  @override
  void receiveDamage(double damage, dynamic from) {
    this.showDamage(
      damage,
      config: TextConfig(
        fontSize: width / 3,
        color: Colors.white,
      ),
    );
    super.receiveDamage(damage, from);
  }
}
