import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:gamejam/game/player/interface_components/mission.dart';

import 'interface_components/bar_life_component.dart';
import 'interface_components/level.dart';
import 'interface_components/score.dart';
import 'interface_components/trash_count.dart';

class FaxineiraBattleInterface extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level(size.width));
    add(Score(size.width));
    super.resize(size);
  }
}

class FaxineiraOfficeInterface extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level(size.width));
    add(Mission(size.width));
    add(TrashCount(size.width));
    super.resize(size);
  }
}
