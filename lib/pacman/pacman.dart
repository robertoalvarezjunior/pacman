import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/enemy/orange_ghost.dart';
import 'package:pacman/enemy/pink_ghost.dart';
import 'package:pacman/enemy/red_ghost.dart';
import 'package:pacman/interface/score.dart';
import 'package:pacman/pacman/player_sprite_sheet.dart';
import 'package:pacman/pill/pill.dart';
import 'package:pacman/pill/power_pill/power_pill.dart';
import 'package:pacman/screen/screen_game.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  static int vida = 2;
  final BuildContext cont;
  Pacman(Vector2 position, {required this.cont})
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: PlayerSpriteSheet.idleRight,
            idleLeft: PlayerSpriteSheet.idleLeft,
            idleUp: PlayerSpriteSheet.idleUp,
            idleDown: PlayerSpriteSheet.idleDown,
            runRight: PlayerSpriteSheet.runRight,
            runLeft: PlayerSpriteSheet.runLeft,
            runUp: PlayerSpriteSheet.runUp,
            runDown: PlayerSpriteSheet.runDown,
          ),
          size: Vector2(18, 18),
          speed: 62,
          initDirection: Direction.right,
          life: 1,
        ) {
    enabledDiagonalMovements = false;
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: 7.5,
            align: Vector2(1, 1),
          ),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (PowerPill.col == false) {
      if (component is RedGhost ||
          component is PinkGhost ||
          component is OrangeGhost) {
        die();
      }
    }
    return super.onCollision(component, active);
  }

  @override
  void die() {
    super.die();
    removeFromParent();
    _navigate(cont);
    Score.score = 0;
    Pacman.vida -= 1;
  }

  @override
  void update(double dt) {
    if (Pill.pill == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Ganhou'),
          );
        },
      );
    }
    if (Pacman.vida <= 0) {
      showDialog(
        context: cont,
        builder: (cont) {
          return const AlertDialog(
            content: Text('Game Over'),
          );
        },
      );
    }
    super.update(dt);
  }

  void _navigate(cont) {
    Navigator.push(
      cont,
      MaterialPageRoute(
        builder: (cont) => const ScreenGame(),
      ),
    );
  }
}
