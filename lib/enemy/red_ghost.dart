import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/enemySheet/red_sprite_sheet.dart';
import 'package:pacman/enemy/ghosts.dart';

class RedGhost extends Ghost {
  RedGhost(Vector2 position)
      : super(
          pos: position,
          idleRight: RedSpriteSheet.idleRight,
          idleLeft: RedSpriteSheet.idleLeft,
          idleUp: RedSpriteSheet.idleUp,
          idleDown: RedSpriteSheet.idleDown,
          runRight: RedSpriteSheet.runRight,
          runLeft: RedSpriteSheet.runLeft,
          runUp: RedSpriteSheet.fun,
          runDown: RedSpriteSheet.runDown,
        );
}
