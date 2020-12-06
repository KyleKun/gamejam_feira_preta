import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../decoration/paper_draggable.dart';
import '../decoration/big_table.dart';
import '../decoration/small_table.dart';
import '../decoration/torch.dart';
import '../enemy/all_enemies.dart';
import '../player/beatriz.dart';
import '../player/interfaces.dart';
import '../utils/constants.dart';
import '../utils/invisible_walls.dart';
import '../utils/sound.dart';
import '../utils/change_map.dart';

class BattleMap3 extends StatefulWidget {
  final Position position;
  const BattleMap3({Key key, this.position}) : super(key: key);

  @override
  _BattleMap3State createState() => _BattleMap3State();
}

class _BattleMap3State extends State<BattleMap3> implements GameListener {
  bool showGameOver = false;

  GameController _controller = new GameController();

  void changeCountLiveEnemies(int count) {
    return;
  }

  void updateGame() {}

  @override
  void initState() {
    _controller = GameController()..setListener(this);
    Sound.playBattleSound();
    super.initState();
  }

  @override
  void dispose() {
    //Sound.stopBackgroundSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Constants.tileSize = max(constraints.maxHeight, constraints.maxWidth) /
            (kIsWeb ? 25 : 22);
        return BonfireTiledWidget(
          joystick: Joystick(
            keyboardEnable: true,
            directional: JoystickDirectional(
              spriteBackgroundDirectional: Sprite('joystick_background.png'),
              spriteKnobDirectional: Sprite('joystick_knob.png'),
              size: 100,
              isFixed: true,
            ),
            actions: [
              JoystickAction(
                actionId: 0,
                sprite: Sprite('joystick_attack.png'),
                align: JoystickActionAlign.BOTTOM_RIGHT,
                size: 80,
                margin: EdgeInsets.only(bottom: 50, right: 50),
              ),
              JoystickAction(
                actionId: 1,
                sprite: Sprite('joystick_attack_range.png'),
                spriteBackgroundDirection: Sprite('joystick_background.png'),
                enableDirection: true,
                size: 50,
                margin: EdgeInsets.only(bottom: 50, right: 160),
              )
            ],
          ),
          player: Beatriz(
            widget.position,
          ),
          interface: BeatrizBattleInterface2(),
          map: TiledWorldMap(
            'tiled/battle_map.json',
            forceTileSize: Size(Constants.tileSize, Constants.tileSize),
          )
            ..registerObject(
                'top_wall',
                (x, y, width, height) =>
                    HorizontalInvisibleWall(Position(x, y)))
            ..registerObject(
                'bottom_wall',
                (x, y, width, height) =>
                    HorizontalInvisibleWall(Position(x, y)))
            ..registerObject('left_wall',
                (x, y, width, height) => VerticalInvisibleWall(Position(x, y)))
            ..registerObject('right_wall',
                (x, y, width, height) => VerticalInvisibleWall(Position(x, y)))
            ..registerObject(
                'enemy', (x, y, width, height) => CommonEnemy3(Position(x, y)))
            ..registerObject(
                'torch', (x, y, width, height) => Torch(Position(x, y)))
            // ..registerObject('barrel',
            //     (x, y, width, height) => BarrelDraggable(Position(x, y)))
            ..registerObject('small_table',
                (x, y, width, height) => SmallTable(Position(x, y)))
            ..registerObject(
                'big_table', (x, y, width, height) => BigTable(Position(x, y))),
          background: BackgroundColorGame(Colors.black87),
          lightingColorGame: Colors.black.withOpacity(0.5),
          cameraZoom: 1.0,
        );
      },
    );
  }
}
