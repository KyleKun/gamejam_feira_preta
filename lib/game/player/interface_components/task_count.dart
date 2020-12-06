import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:gamejam/game/player/beatriz.dart';

class TaskCount1 extends InterfaceComponent {
  final size;
  int taskCount = 0;

  TaskCount1(this.size)
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
      if (this.gameRef.player is Beatriz) {
        taskCount = (this.gameRef.player as Beatriz).taskCount;
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
      "$taskCount/3",
      Position(size - 130, 20),
    );
  }
}

class TaskCount2 extends InterfaceComponent {
  final size;
  int taskCount = 0;

  TaskCount2(this.size)
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
      if (this.gameRef.player is Beatriz) {
        taskCount = (this.gameRef.player as Beatriz).taskCount;
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
      "$taskCount/50",
      Position(size - 130, 20),
    );
  }
}

class TaskCount3 extends InterfaceComponent {
  final size;
  int taskCount = 0;

  TaskCount3(this.size)
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
      if (this.gameRef.player is Beatriz) {
        taskCount = (this.gameRef.player as Beatriz).taskCount;
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
      "$taskCount/1",
      Position(size - 130, 20),
    );
  }
}
