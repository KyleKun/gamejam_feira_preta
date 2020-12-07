import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:gamejam/game/decoration/copiadora.dart';
import 'package:gamejam/game/decoration/trash.dart';
import 'package:gamejam/game/npc/npc2.dart';
import 'package:gamejam/game/npc/npc_1.dart';

import '../player/beatriz.dart';
import '../player/interfaces.dart';
import '../utils/constants.dart';
import '../utils/invisible_walls.dart';
import '../utils/sound.dart';

class OfficeMap2 extends StatefulWidget {
  final Position position;
  const OfficeMap2({Key key, this.position}) : super(key: key);

  @override
  _OfficeMap2State createState() => _OfficeMap2State();
}

class _OfficeMap2State extends State<OfficeMap2> implements GameListener {
  bool showGameOver = false;

  GameController _controller = new GameController();

  void changeCountLiveEnemies(int count) {
    return;
  }

  void updateGame() {}

  @override
  void initState() {
    _controller = GameController()..setListener(this);
    Sound.playBackgroundSound();
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
        return BonfireTiledWidget(
          joystick: Joystick(
            keyboardEnable: true,
            directional: JoystickDirectional(
              spriteBackgroundDirectional: Sprite('joystick_background.png'),
              spriteKnobDirectional: Sprite('joystick_knob.png'),
              size: 100,
              isFixed: true,
            ),
            // actions: [
            //   JoystickAction(
            //     actionId: 0,
            //     sprite: Sprite('joystick_attack.png'),
            //     align: JoystickActionAlign.BOTTOM_RIGHT,
            //     size: 80,
            //     margin: EdgeInsets.only(bottom: 50, right: 50),
            //   ),
            //   JoystickAction(
            //     actionId: 1,
            //     sprite: Sprite('joystick_attack_range.png'),
            //     spriteBackgroundDirection: Sprite('joystick_background.png'),
            //     enableDirection: true,
            //     size: 50,
            //     margin: EdgeInsets.only(bottom: 50, right: 160),
            //   )
            // ],
          ),
          player: Beatriz(widget.position, 2),
          interface: BeatrizOfficeInterface2(), // _getInterface(),
          map: TiledWorldMap(
            'tiled/fase2.json',
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
                'npc2', (x, y, width, height) => NPC2(Position(x, y)))
            ..registerObject('b',
                (x, y, width, height) => BlockInvisibleWall(Position(x, y)))
            ..registerObject('copiadora',
                (x, y, width, height) => Copiadora(Position(x, y))),
          background: BackgroundColorGame(Colors.black87),
          cameraZoom: 1.0,
        );
      },
    );
  }
}
