import 'dart:ui';

import 'package:bonfire/bonfire.dart';

import 'interface_components/bar_life_component.dart';
import 'faxineira.dart';
import 'interface_components/level.dart';
import 'interface_components/score.dart';

class FaxineiraInterface extends GameInterface {
  @override
  void resize(Size size) {
    add(BarLifeComponent());
    add(Level(size.width));
    add(Score(size.width));
    super.resize(size);
  }
}
