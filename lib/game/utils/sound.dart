import 'package:audioplayers/audioplayers.dart';
import 'package:bonfire/bonfire.dart';

class Sound {
  static AudioPlayer audioBackground;
  static void attackPlayerMelee() {
    Flame.audio.play('attack_player.mp3', volume: 0.4);
  }

  static void completeSound() {
    Flame.audio.play('complete.wav', volume: 0.4);
  }

  static void bip() {
    Flame.audio.play('bip.wav', volume: 0.4);
  }

  static void attackRange() {
    Flame.audio.play('attack_fire_ball.wav', volume: 0.4);
  }

  static void attackEnemyMelee() {
    Flame.audio.play('attack_enemy.mp3', volume: 0.4);
  }

  static void explosion() {
    Flame.audio.play('explosion.wav', volume: 0.5);
  }

  // static void interaction() {
  //   Flame.audio.play('sound_interaction.wav', volume: 0.4);
  // }

  static void stopBackgroundSound() {
    if (audioBackground != null) {
      audioBackground.stop().then((resp) {
        audioBackground = null;
      });
    }
  }

  //  static void playMenuSound(){
  //   stopBackgroundSound();
  //   Flame.audio
  //       .loopLongAudio('menu_song.mp3', volume: 0.6)
  //       .then((audioPlayer) {
  //     audioBackground = audioPlayer;
  //   });
  // }

  static void playBackgroundSound() {
    stopBackgroundSound();
    Flame.audio.loopLongAudio('song1.mp3', volume: 0.4).then((audioPlayer) {
      audioBackground = audioPlayer;
    });
  }

  static void playBattleSound() {
    stopBackgroundSound();
    Flame.audio
        .loopLongAudio('new_battle_song.mp3', volume: 0.4)
        .then((audioPlayer) {
      audioBackground = audioPlayer;
    });
  }

  // static void playBackgroundBossSound() {
  //   stopBackgroundSound();
  //   Flame.audio.loopLongAudio('boss_song.mp3', volume: 0.6).then((audioPlayer) {
  //     audioBackground = audioPlayer;
  //   });
  // }
}
