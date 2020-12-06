import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:gamejam/game/map/office_map.dart';

import 'game/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Comment for running in browser
  //await Flame.util.setLandscape();
  //await Flame.util.fullScreen();
  runApp(MaterialApp(home: Menu(), debugShowCheckedModeBanner: false));
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
              child: Text('Jogar'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: OfficeMap(
                        position: Position(
                          (kIsWeb
                              ? 18 * Constants.tileSize
                              : 13 * Constants.tileSize),
                          (4 * Constants.tileSize),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
