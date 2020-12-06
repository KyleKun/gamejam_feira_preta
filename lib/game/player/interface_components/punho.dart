import 'dart:ui';

import 'package:bonfire/bonfire.dart';

class Punho extends InterfaceComponent {
  final size;

  Punho(this.size)
      : super(
          id: 6,
          position: Position(size / 2.1, 20),
          sprite: Sprite('punho.png'),
          height: 64,
          width: 64,
        );

  @override
  void render(Canvas c) {
    super.render(c);
  }
}
