import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/player/beatriz.dart';

class Level1 extends InterfaceComponent {
  final size;
  String level;

  Level1(this.size)
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
      if (this.gameRef.player is Beatriz) {
        level = (this.gameRef.player as Beatriz).level1;
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

class Level2 extends InterfaceComponent {
  final size;
  String level;

  Level2(this.size)
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
      if (this.gameRef.player is Beatriz) {
        level = (this.gameRef.player as Beatriz).level2;
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

class Level3 extends InterfaceComponent {
  final size;
  String level;

  Level3(this.size)
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
      if (this.gameRef.player is Beatriz) {
        level = (this.gameRef.player as Beatriz).level3;
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

class Level4 extends InterfaceComponent {
  final size;
  String level;

  Level4(this.size)
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
      if (this.gameRef.player is Beatriz) {
        level = (this.gameRef.player as Beatriz).level4;
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
