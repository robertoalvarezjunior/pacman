import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/enemySheet/orange_sprite_sheet.dart';
import 'package:pacman/enemy/ghosts.dart';

class OrangeGhost extends Ghost {
  OrangeGhost(Vector2 position)
      : super(
          pos: position,
          idleRight: OrangeSpriteSheet.idleRight,
          idleLeft: OrangeSpriteSheet.idleLeft,
          idleUp: OrangeSpriteSheet.idleUp,
          idleDown: OrangeSpriteSheet.idleDown,
          runRight: OrangeSpriteSheet.runRight,
          runLeft: OrangeSpriteSheet.runLeft,
          runUp: OrangeSpriteSheet.runUp,
          runDown: OrangeSpriteSheet.runDown,
        );
}
