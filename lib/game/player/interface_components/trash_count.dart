import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/player/faxineira.dart';

class TrashCount extends InterfaceComponent {
  final size;
  int trashCount = 0;

  TrashCount(this.size)
      : super(
          id: 3,
          position: Position(size - 130, 20),
          height: 16,
          width: 16,
        );

  final TextConfig config =
      TextConfig(fontSize: 48.0, color: Colors.white, fontFamily: 'Pixel');
  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      if (this.gameRef.player is Faxineira) {
        trashCount = (this.gameRef.player as Faxineira).trashCount;
      }
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    try {
      _drawScore(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawScore(Canvas canvas) {
    config.render(
      canvas,
      "Lixo: $trashCount/3",
      Position(size - 130, 20),
    );
  }
}
