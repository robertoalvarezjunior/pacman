import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/enemy/orange_ghost.dart';
import 'package:pacman/enemy/pink_ghost.dart';
import 'package:pacman/enemy/red_ghost.dart';
import 'package:pacman/interface/score.dart';
import 'package:pacman/pacman/pacman.dart';
import 'package:pacman/pill/pill.dart';
import 'package:pacman/pill/power_pill/power_pill.dart';

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
            ),
          ),
          map: WorldMapByTiled(
            'tiled/background.json',
            forceTileSize: Vector2(32, 32),
            objectsBuilder: {
              'orange_ghost': (properties) => OrangeGhost(properties.position),
              'pink_ghost': (properties) => PinkGhost(properties.position),
              'red_ghost': (properties) => RedGhost(properties.position),
              'power_pill': (properties) => PowerPill(properties.position),
              'pill': (properties) => Pill(properties.position),
            },
          ),
          overlayBuilderMap: {
            Score.overlayKey: (context, game) => Score(game: game),
          },
          initialActiveOverlays: const [Score.overlayKey],
          player: Pacman(
            cont: context,
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
