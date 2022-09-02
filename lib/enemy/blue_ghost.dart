import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/enemySheet/blue_sprite_sheet.dart';
import 'package:pacman/enemy/ghosts.dart';

class BlueGhost extends Ghost {
  BlueGhost(Vector2 position)
      : super(
          pos: position,
          idleRight: BlueSpriteSheet.idleRight,
          idleLeft: BlueSpriteSheet.idleLeft,
          idleUp: BlueSpriteSheet.idleUp,
          idleDown: BlueSpriteSheet.idleDown,
          runRight: BlueSpriteSheet.runRight,
          runLeft: BlueSpriteSheet.runLeft,
          runUp: BlueSpriteSheet.runUp,
          runDown: BlueSpriteSheet.runDown,
        );
}
