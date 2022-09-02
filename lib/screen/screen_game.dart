import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/enemy/blue_ghost.dart';
import 'package:pacman/enemy/orange_ghost.dart';
import 'package:pacman/enemy/pink_ghost.dart';
import 'package:pacman/enemy/purple_ghost.dart';
import 'package:pacman/enemy/red_ghost.dart';
import 'package:pacman/pacman/pacman.dart';

class ScreenGame extends StatefulWidget {
  const ScreenGame({Key? key}) : super(key: key);

  @override
  State<ScreenGame> createState() => _ScreenGameState();
}

class _ScreenGameState extends State<ScreenGame> {
  final double tileSize = 32;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BonfireWidget(
          joystick: Joystick(
              keyboardConfig: KeyboardConfig(
                enable: true,
                keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
              ),
              directional: JoystickDirectional(
                isFixed: false,
              )),
          map: WorldMapByTiled(
            'tiled/background.json',
            forceTileSize: Vector2(32, 32),
            objectsBuilder: {
              'blue_ghost': (properties) => BlueGhost(properties.position),
              'orange_ghost': (properties) => OrangeGhost(properties.position),
              'pink_ghost': (properties) => PinkGhost(properties.position),
              'purple_ghost': (properties) => PurpleGhost(properties.position),
              'red_ghost': (properties) => RedGhost(properties.position),
            },
          ),
          player: Pacman(
            Vector2(2 * tileSize, 20 * 32.4),
          ),
          cameraConfig: CameraConfig(
            moveOnlyMapArea: true,
          ),
        ),
      ),
    );
  }
}
