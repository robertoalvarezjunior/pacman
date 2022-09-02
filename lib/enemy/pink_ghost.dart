import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/enemySheet/pink_sprite_sheet.dart';
import 'package:pacman/enemy/ghosts.dart';

class PinkGhost extends Ghost {
  PinkGhost(Vector2 position)
      : super(
          pos: position,
          idleRight: PinkSpriteSheet.idleRight,
          idleLeft: PinkSpriteSheet.idleLeft,
          idleUp: PinkSpriteSheet.idleUp,
          idleDown: PinkSpriteSheet.idleDown,
          runRight: PinkSpriteSheet.runRight,
          runLeft: PinkSpriteSheet.runLeft,
          runUp: PinkSpriteSheet.runUp,
          runDown: PinkSpriteSheet.runDown,
        );
}
