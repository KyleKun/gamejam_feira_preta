import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/player/beatriz.dart';

class Score1 extends InterfaceComponent {
  final size;
  int score = 0;

  Score1(this.size)
      : super(
          id: 3,
          position: Position(size - 80, 20),
          height: 16,
          width: 16,
        );

  final TextConfig config =
      TextConfig(fontSize: 48.0, color: Colors.white, fontFamily: 'Pixel');
  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      if (this.gameRef.player is Beatriz) {
        score = (this.gameRef.player as Beatriz).killScore;
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
      "$score/4",
      Position(size - 80, 20),
    );
  }
}

class Score2 extends InterfaceComponent {
  final size;
  int score = 0;

  Score2(this.size)
      : super(
          id: 3,
          position: Position(size - 80, 20),
          height: 16,
          width: 16,
        );

  final TextConfig config =
      TextConfig(fontSize: 48.0, color: Colors.white, fontFamily: 'Pixel');
  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      if (this.gameRef.player is Beatriz) {
        score = (this.gameRef.player as Beatriz).killScore;
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
      "$score/6",
      Position(size - 80, 20),
    );
  }
}

class Score3 extends InterfaceComponent {
  final size;
  int score = 0;

  Score3(this.size)
      : super(
          id: 3,
          position: Position(size - 80, 20),
          height: 16,
          width: 16,
        );

  final TextConfig config =
      TextConfig(fontSize: 48.0, color: Colors.white, fontFamily: 'Pixel');
  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      if (this.gameRef.player is Beatriz) {
        score = (this.gameRef.player as Beatriz).killScore;
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
      "$score/8",
      Position(size - 80, 20),
    );
  }
}

class Score4 extends InterfaceComponent {
  final size;
  int score = 0;

  Score4(this.size)
      : super(
          id: 3,
          position: Position(size - 80, 20),
          height: 16,
          width: 16,
        );

  final TextConfig config =
      TextConfig(fontSize: 48.0, color: Colors.white, fontFamily: 'Pixel');
  @override
  void update(double t) {
    if (this.gameRef.player != null) {
      if (this.gameRef.player is Beatriz) {
        score = (this.gameRef.player as Beatriz).killScore;
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
      "$score/10",
      Position(size - 80, 20),
    );
  }
}
