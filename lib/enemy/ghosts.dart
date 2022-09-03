import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/enemySheet/scared_sprite_sheet.dart';
import 'package:pacman/enemy/orange_ghost.dart';
import 'package:pacman/enemy/pink_ghost.dart';
import 'package:pacman/enemy/red_ghost.dart';
import 'package:pacman/interface/score.dart';
import 'package:pacman/pacman/pacman.dart';
import 'package:pacman/pill/power_pill/power_pill.dart';

class Ghost extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  final Future<SpriteAnimation> idleRight;
  final Future<SpriteAnimation> idleLeft;
  final Future<SpriteAnimation> idleUp;
  final Future<SpriteAnimation> idleDown;
  final Future<SpriteAnimation> runRight;
  final Future<SpriteAnimation> runLeft;
  final Future<SpriteAnimation> runUp;
  Future<SpriteAnimation> runDown;
  final Vector2 pos;

  double ghostSpeed = 60;

  Ghost({
    required this.pos,
    required this.idleRight,
    required this.idleLeft,
    required this.idleUp,
    required this.idleDown,
    required this.runRight,
    required this.runLeft,
    required this.runUp,
    required this.runDown,
  }) : super(
          position: pos,
          animation: SimpleDirectionAnimation(
            idleRight: idleRight,
            idleLeft: idleLeft,
            idleUp: idleUp,
            idleDown: idleDown,
            runRight: runRight,
            runLeft: runLeft,
            runUp: runUp,
            runDown: runDown,
          ),
          size: Vector2(16, 16),
          life: 10,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.circle(
            radius: 6,
            align: Vector2(1.5, 1),
          ),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is RedGhost ||
        component is PinkGhost ||
        component is OrangeGhost) {
      return active = false;
    }
    if (PowerPill.col == true) {
      animation?.playOnce(ScaredSriteSheet.scared, runToTheEnd: true);
      if (component is Pacman) {
        die();
        Score.score += 200;
      }
    }
    return super.onCollision(component, active);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _moveToPlayer(dt);
  }

  void _moveToPlayer(dt) {
    if (PowerPill.col == false) {
      seeAndMoveToPlayer(
        observed: () {
          speed = ghostSpeed;
        },
        closePlayer: (player) {},
        radiusVision: 32 * 2,
        notObserved: () {
          runRandomMovement(
            dt,
            speed: ghostSpeed,
            timeKeepStopped: 0,
            maxDistance: 32 * 10,
            minDistance: random(32, 64),
          );
        },
        margin: 0,
      );
    } else {
      runRandomMovement(
        dt,
        speed: ghostSpeed,
        timeKeepStopped: 0,
        maxDistance: 32 * 10,
        minDistance: random(32, 64),
      );
    }
  }
}
