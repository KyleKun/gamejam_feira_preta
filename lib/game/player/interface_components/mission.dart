import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/player/faxineira.dart';

class Mission extends InterfaceComponent {
  final size;
  String mission;
  double strokeWidth = 12;

  Mission(this.size)
      : super(
          id: 4,
          position: Position(size / 2.2, 10),
          height: 16,
          width: 16,
        );

  final TextConfig config =
      TextConfig(fontSize: 38.0, color: Colors.orange, fontFamily: 'Pixel');
  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      if (this.gameRef.player is Faxineira) {
        mission = (this.gameRef.player as Faxineira).mission;
      }
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    try {
      _drawMission(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawMission(Canvas canvas) {
    double xBar = position.left + 65;
    double yBar = position.top + 35;
    canvas.drawCircle(
        Offset(xBar, yBar),
        80,
        Paint()
          ..color = Colors.black87.withOpacity(0.6)
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
    config.render(
      canvas,
      "  OBJETIVO\n$mission",
      Position(size / 2.2, 10),
    );
  }
}
