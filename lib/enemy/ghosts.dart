import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/blue_ghost.dart';
import 'package:pacman/enemy/orange_ghost.dart';
import 'package:pacman/enemy/pink_ghost.dart';
import 'package:pacman/enemy/purple_ghost.dart';
import 'package:pacman/enemy/red_ghost.dart';

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

  double ghostSpeed = 58;

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
          life: 1,
          size: Vector2(16, 16),
          initDirection: Direction.up,
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
        component is BlueGhost ||
        component is PinkGhost ||
        component is OrangeGhost ||
        component is PurpleGhost) {
      return active = false;
    }
    return super.onCollision(component, active);
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
    seeAndMoveToPlayer(
      observed: () {
        speed = ghostSpeed;
      },
      closePlayer: (player) {},
      radiusVision: 32 * 5,
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
  }
}
