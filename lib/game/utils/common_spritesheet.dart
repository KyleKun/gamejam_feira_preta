import 'package:bonfire/bonfire.dart';

class CommonSpriteSheet {
  static Animation get npc1 => Animation.sequenced(
        'npc/npc1.png',
        2,
        amountPerRow: 1,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get npc2 => Animation.sequenced(
        'npc/npc2.png',
        2,
        amountPerRow: 1,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get npc3 => Animation.sequenced(
        'npc/npc3.png',
        2,
        amountPerRow: 1,
        textureWidth: 160,
        textureHeight: 160,
      );

  static Animation get explosionAnimation => Animation.sequenced(
        'player/explosion_fire.png',
        6,
        textureWidth: 32,
        textureHeight: 32,
      );

  static Animation get emote => Animation.sequenced(
        'player/emote_exclamacao.png',
        8,
        textureWidth: 32,
        textureHeight: 32,
      );
  static Animation get smokeExplosion => Animation.sequenced(
        "smoke_explosin.png",
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get whiteAttackEffectBottom => Animation.sequenced(
        'player/atack_effect_bottom.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get whiteAttackEffectLeft => Animation.sequenced(
        'player/atack_effect_left.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get whiteAttackEffectRight => Animation.sequenced(
        'player/atack_effect_right.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get whiteAttackEffectTop => Animation.sequenced(
        'player/atack_effect_top.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get blackAttackEffectBottom => Animation.sequenced(
        'enemy/atack_effect_bottom.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get blackAttackEffectLeft => Animation.sequenced(
        'enemy/atack_effect_left.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get blackAttackEffectRight => Animation.sequenced(
        'enemy/atack_effect_right.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get blackAttackEffectTop => Animation.sequenced(
        'enemy/atack_effect_top.png',
        6,
        textureWidth: 16,
        textureHeight: 16,
      );

  static Animation get vassouraTop => Animation.sequenced(
        'player/vassoura.png',
        1,
        textureWidth: 160,
        textureHeight: 160,
      );

  static SimpleDirectionAnimation get simpleNpc1 => SimpleDirectionAnimation(
        idleLeft: npc1,
        idleRight: npc1,
        runLeft: npc1,
        runRight: npc1,
      );

  static SimpleDirectionAnimation get simpleNpc2 => SimpleDirectionAnimation(
        idleLeft: npc2,
        idleRight: npc2,
        runLeft: npc2,
        runRight: npc2,
      );

  static SimpleDirectionAnimation get simpleNpc3 => SimpleDirectionAnimation(
        idleLeft: npc3,
        idleRight: npc3,
        runLeft: npc3,
        runRight: npc3,
      );
}
