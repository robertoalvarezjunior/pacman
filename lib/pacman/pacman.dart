import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/blue_ghost.dart';
import 'package:pacman/enemy/orange_ghost.dart';
import 'package:pacman/enemy/pink_ghost.dart';
import 'package:pacman/enemy/purple_ghost.dart';
import 'package:pacman/enemy/red_ghost.dart';
import 'package:pacman/pacman/player_sprite_sheet.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  //static double pacmanSpeed = 62;
  Pacman(Vector2 position)
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
    if (component is RedGhost ||
        component is BlueGhost ||
        component is PinkGhost ||
        component is OrangeGhost ||
        component is PurpleGhost) {
      die();
    }
    return super.onCollision(component, active);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
