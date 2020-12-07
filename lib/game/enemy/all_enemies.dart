import 'package:bonfire/bonfire.dart';
import 'package:flame/position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/enemy/end_game.dart';
import 'package:gamejam/game/map/2office_map.dart';
import 'package:gamejam/game/map/3office_map.dart';
import 'package:gamejam/game/map/office_map.dart';
import 'package:gamejam/game/player/beatriz.dart';
import 'package:gamejam/game/utils/common_spritesheet.dart';
import 'package:gamejam/game/utils/constants.dart';
import 'package:gamejam/game/utils/enemy_spritesheet.dart';
import 'package:gamejam/game/utils/sound.dart';
import '../utils/change_map.dart';

class CommonEnemy1 extends SimpleEnemy {
  double attack = 20;
  bool completedBattle = false;

  CommonEnemy1(Position initPosition)
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

  void _goToOffice(BuildContext context) {
    {
      Sound.stopBackgroundSound();
      Future.delayed(Duration(milliseconds: (1 * 1000)), () {
        context.goTo(new OfficeMap2(
            position: Position(
                (kIsWeb ? 18 * Constants.tileSize : 11 * Constants.tileSize),
                (17 * Constants.tileSize))));
      });
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (this.isDead) return;
    if ((gameRef.player as Beatriz).killScore == 4 && !completedBattle) {
      // TODO: insert talk
      completedBattle = true;
      _goToOffice(gameRef.context);
    }

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

    gameRef.add(CommonEnemy1(
        Position((5.5 * Constants.tileSize), (3.8 * Constants.tileSize))));
    (gameRef.player as Beatriz).killScore += 1;

    remove();
    super.die();
  }

  void execAttack() {
    if (gameRef.player != null && gameRef.player.isDead) return;

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

class CommonEnemy2 extends SimpleEnemy {
  double attack = 25;
  bool completedBattle = false;

  CommonEnemy2(Position initPosition)
      : super(
            animation: EnemySpriteSheet.simpleDirectionAnimation,
            initPosition: initPosition,
            width: Constants.tileSize * 0.8,
            height: Constants.tileSize * 0.8,
            speed: Constants.tileSize * 1.6,
            life: 110,
            collision: Collision(
                height: Constants.tileSize * 0.4,
                width: Constants.tileSize * 0.4,
                align: Offset(
                  Constants.tileSize * 0.2,
                  Constants.tileSize * 0.4,
                )));

  void _goToOffice(BuildContext context) {
    {
      Sound.stopBackgroundSound();
      Future.delayed(Duration(milliseconds: (1 * 1000)), () {
        context.goTo(new OfficeMap3(
            position: Position(
                (kIsWeb ? 18 * Constants.tileSize : 11 * Constants.tileSize),
                (17 * Constants.tileSize))));
      });
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (this.isDead) return;
    if ((gameRef.player as Beatriz).killScore == 6 && !completedBattle) {
      // TODO: insert talk
      completedBattle = true;
      _goToOffice(gameRef.context);
    }

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

    gameRef.add(CommonEnemy2(
        Position((5.5 * Constants.tileSize), (3.8 * Constants.tileSize))));
    (gameRef.player as Beatriz).killScore += 1;

    remove();
    super.die();
  }

  void execAttack() {
    if (gameRef.player != null && gameRef.player.isDead) return;

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

class CommonEnemy3 extends SimpleEnemy {
  double attack = 30;
  bool completedBattle = false;

  CommonEnemy3(Position initPosition)
      : super(
            animation: EnemySpriteSheet.simpleDirectionAnimation,
            initPosition: initPosition,
            width: Constants.tileSize * 0.8,
            height: Constants.tileSize * 0.8,
            speed: Constants.tileSize * 1.6,
            life: 120,
            collision: Collision(
                height: Constants.tileSize * 0.4,
                width: Constants.tileSize * 0.4,
                align: Offset(
                  Constants.tileSize * 0.2,
                  Constants.tileSize * 0.4,
                )));

  void _goToEnd(BuildContext context) {
    {
      Sound.stopBackgroundSound();
      Future.delayed(Duration(milliseconds: (1 * 1000)), () {
        context.goTo(new EndGame());
      });
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (this.isDead) return;
    if ((gameRef.player as Beatriz).killScore == 8 && !completedBattle) {
      // TODO: insert talk
      completedBattle = true;
      _goToEnd(gameRef.context);
    }

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

    gameRef.add(CommonEnemy3(
        Position((5.5 * Constants.tileSize), (3.8 * Constants.tileSize))));
    (gameRef.player as Beatriz).killScore += 1;

    remove();
    super.die();
  }

  void execAttack() {
    if (gameRef.player != null && gameRef.player.isDead) return;

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

class CommonEnemy4 extends SimpleEnemy {
  double attack = 20;
  bool completedBattle = false;

  CommonEnemy4(Position initPosition)
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

  void _goToOffice(BuildContext context) {
    {
      Sound.stopBackgroundSound();
      Future.delayed(Duration(milliseconds: (1 * 1000)), () {
        context.goTo(new OfficeMap3(
            position: Position(
                (kIsWeb ? 18 * Constants.tileSize : 11 * Constants.tileSize),
                (17 * Constants.tileSize))));
      });
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (this.isDead) return;
    if ((gameRef.player as Beatriz).killScore == 10 && !completedBattle) {
      // TODO: insert talk
      completedBattle = true;
      _goToOffice(gameRef.context);
    }

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

    gameRef.add(CommonEnemy4(
        Position((5.5 * Constants.tileSize), (3.8 * Constants.tileSize))));
    (gameRef.player as Beatriz).killScore += 1;

    remove();
    super.die();
  }

  void execAttack() {
    if (gameRef.player != null && gameRef.player.isDead) return;

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
