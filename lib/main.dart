import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:gamejam/game/map/office_map.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'game/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Comment for running in browser
  // await Flame.util.setLandscape();
  // await Flame.util.fullScreen();
  runApp(MaterialApp(home: Menu(), debugShowCheckedModeBanner: false));
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      Constants.tileSize =
          max(constraints.maxHeight, constraints.maxWidth) / (kIsWeb ? 25 : 22);
      return Scaffold(
          body: Container(
        width: double.maxFinite,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/ui/menu.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white,
                  ),
                  width: 500,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Level Up, Beatriz!',
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontFamily: 'Pixel',
                          fontSize: 84.0),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                RaisedButton(
                    elevation: 10.0,
                    child: Text(
                      'Jogar',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pixel',
                          fontSize: 36.0),
                    ),
                    color: Colors.greenAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: OfficeMap(
                              position: Position(
                                (16 * Constants.tileSize),
                                (4 * Constants.tileSize),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                Spacer(),
                RaisedButton(
                    elevation: 10.0,
                    child: Text(
                      'Sobre',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pixel',
                          fontSize: 36.0),
                    ),
                    color: Colors.blueAccent,
                    onPressed: () {
                      new Alert(
                        context: context,
                        type: AlertType.info,
                        title: 'Sobre',
                        style: AlertStyle(
                          isOverlayTapDismiss: false,
                          overlayColor: Colors.black26,
                          titleStyle: TextStyle(fontSize: 28),
                          backgroundColor: Colors.black87,
                        ),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Como Jogar: Utilize as setas do teclado ou o joystick para se movimentar.\nPara atacar, clique nos botões no canto inferior direito da tela.\nPara interagir com objetos ou NPCs, basta chegar perto ou clicar em cima.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Pixel',
                                  fontSize: 24.0),
                            ),
                            Text(
                              'Equipe\n- Caio Pedroso (Dev/Compositor)\n- Rodrigo Cotrin (Arte)\n- Lannara Silva (Business)',
                              style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontFamily: 'Pixel',
                                  fontSize: 24.0),
                            ),
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            color: Colors.blueAccent,
                            child: Text(
                              "Fechar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            width: 120,
                          ),
                        ],
                      ).show();
                    }),
                Spacer(),
              ],
            )
          ],
        ),
      ));
    });
  }
}
