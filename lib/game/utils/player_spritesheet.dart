import 'package:bonfire/bonfire.dart';

// TODO: replace images and rename it
class PlayerSpriteSheet {
  static Animation get idleLeft => Animation.sequenced(
        "player/faxineira_left.png",
        1,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get idleRight => Animation.sequenced(
        "player/faxineira_right.png",
        1,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get idleTop => Animation.sequenced(
        "player/idle_top.png",
        2,
        amountPerRow: 1,
        textureWidth: 160,
        textureHeight: 160,
        stepTime: 1.0,
      );

  static Animation get idleBottom => Animation.sequenced(
        "player/faxineira_bottom.png",
        1,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get runRight => Animation.sequenced(
        "player/faxineira_right.png",
        8,
        amountPerRow: 3,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get runLeft => Animation.sequenced(
        "player/faxineira_left.png",
        8,
        amountPerRow: 3,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get runTop => Animation.sequenced(
        "player/faxineira_top.png",
        6,
        amountPerRow: 2,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get runBottom => Animation.sequenced(
        "player/faxineira_bottom.png",
        6,
        amountPerRow: 2,
        textureWidth: 160,
        textureHeight: 160,
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleLeft: idleLeft,
        idleRight: idleRight,
        idleBottom: idleTop,
        idleTop: idleBottom,
        runLeft: runLeft,
        runRight: runRight,
        runBottom: runTop,
        runTop: runBottom,
      );
}
