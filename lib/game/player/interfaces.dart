import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:gamejam/game/player/interface_components/missions.dart';

import 'interface_components/bar_life_component.dart';
import 'interface_components/levels.dart';
import 'interface_components/punho.dart';
import 'interface_components/scores.dart';
import 'interface_components/task_count.dart';

class BeatrizBattleInterface extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level1(size.width));
    add(Punho(size.width));
    add(Score1(size.width));
    super.resize(size);
  }
}

class BeatrizOfficeInterface extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level1(size.width));
    add(Mission1(size.width));
    add(TaskCount1(size.width));
    super.resize(size);
  }
}

class BeatrizBattleInterface2 extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level2(size.width));
    add(Punho(size.width));
    add(Score2(size.width));
    super.resize(size);
  }
}

class BeatrizOfficeInterface2 extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level2(size.width));
    add(Mission2(size.width));
    add(TaskCount2(size.width));
    super.resize(size);
  }
}

class BeatrizBattleInterface3 extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level3(size.width));
    add(Punho(size.width));
    add(Score3(size.width));
    super.resize(size);
  }
}

class BeatrizOfficeInterface3 extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level3(size.width));
    add(Mission3(size.width));
    add(TaskCount3(size.width));
    super.resize(size);
  }
}

// class BeatrizBattleInterface4 extends GameInterface {
//   @override
//   void resize(Size size) {
//     add(BarLifeComponent());
//     add(Level4(size.width));
//     add(Score4(size.width));
//     super.resize(size);
//   }
// }

// class BeatrizOfficeInterface4 extends GameInterface {
//   @override
//   void resize(Size size) {
//     add(BarLifeComponent());
//     add(Level4(size.width));
//     //add(Mission(size.width));
//     //add(TaskCount(size.width, 3));
//     super.resize(size);
//   }
// }
