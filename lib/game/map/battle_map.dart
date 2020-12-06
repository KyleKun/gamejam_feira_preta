import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../decoration/barrel_draggable.dart';
import '../decoration/big_table.dart';
import '../decoration/small_table.dart';
import '../decoration/torch.dart';
import '../enemy/common_enemy.dart';
import '../player/faxineira.dart';
import '../player/faxineira_interface.dart';
import '../utils/constants.dart';
import '../utils/invisible_walls.dart';
import '../utils/sound.dart';
import '../utils/change_map.dart';

class BattleMap extends StatefulWidget {
  final Position position;
  const BattleMap({Key key, this.position}) : super(key: key);

  @override
  _BattleMapState createState() => _BattleMapState();
}

class _BattleMapState extends State<BattleMap> implements GameListener {
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
          player: Faxineira(
            widget.position,
          ),
          interface: FaxineiraBattleInterface(),
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
                'enemy', (x, y, width, height) => CommonEnemy(Position(x, y)))
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
