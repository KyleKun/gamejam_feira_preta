import 'dart:math';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:gamejam/game/decoration/trash.dart';
import 'package:gamejam/game/npc/npc_1.dart';
import '../player/faxineira.dart';
import '../player/faxineira_interface.dart';
import '../utils/constants.dart';
import '../utils/invisible_walls.dart';
import '../utils/sound.dart';

class OfficeMap extends StatefulWidget {
  final Position position;
  const OfficeMap({Key key, this.position}) : super(key: key);

  @override
  _OfficeMapState createState() => _OfficeMapState();
}

class _OfficeMapState extends State<OfficeMap> implements GameListener {
  bool showGameOver = false;

  //GameController _controller = new GameController();

  void changeCountLiveEnemies(int count) {
    return;
  }

  void updateGame() {}

  @override
  void initState() {
    //_controller = GameController()..setListener(this);
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
          player: Faxineira(
            widget.position,
          ),
          interface: FaxineiraOfficeInterface(),
          map: TiledWorldMap(
            'tiled/fase1.json',
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
                'npc1', (x, y, width, height) => NPC1(Position(x, y)))
            ..registerObject(
                'trash', (x, y, width, height) => Trash(Position(x, y)))
            ..registerObject('b',
                (x, y, width, height) => BlockInvisibleWall(Position(x, y))),
          background: BackgroundColorGame(Colors.black87),
          cameraZoom: 1.0,
        );
      },
    );
  }
}
