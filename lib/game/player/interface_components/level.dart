import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/player/faxineira.dart';

class Level extends InterfaceComponent {
  final size;
  String level = 'Cargo: Faxineira';

  Level(this.size)
      : super(
          id: 2,
          position: Position(20, 65),
          height: 16,
          width: 16,
        );

  final TextConfig config =
      TextConfig(fontSize: 36.0, color: Colors.white, fontFamily: 'Pixel');
  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      if (this.gameRef.player is Faxineira) {
        level = (this.gameRef.player as Faxineira).level;
      }
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    try {
      _drawLevel(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawLevel(Canvas canvas) {
    config.render(
      canvas,
      "$level",
      Position(20, 65),
    );
  }
}
