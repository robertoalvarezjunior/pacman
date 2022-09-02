import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/enemySheet/purple_sprite_sheet.dart';
import 'package:pacman/enemy/ghosts.dart';

class PurpleGhost extends Ghost {
  PurpleGhost(Vector2 position)
      : super(
          pos: position,
          idleRight: PurpleSpriteSheet.idleRight,
          idleLeft: PurpleSpriteSheet.idleLeft,
          idleUp: PurpleSpriteSheet.idleUp,
          idleDown: PurpleSpriteSheet.idleDown,
          runRight: PurpleSpriteSheet.runRight,
          runLeft: PurpleSpriteSheet.runLeft,
          runUp: PurpleSpriteSheet.runUp,
          runDown: PurpleSpriteSheet.runDown,
        );
}
