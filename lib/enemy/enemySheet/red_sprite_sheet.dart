import 'package:bonfire/bonfire.dart';
import 'package:pacman/enemy/enemySheet/scared_sprite_sheet.dart';
import 'package:pacman/pill/power_pill/power_pill.dart';

class RedSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        'red_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 0),
        ),
      );
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        'red_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 32 * 2),
        ),
      );
  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        'red_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 32 * 3),
        ),
      );
  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        'red_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 32),
        ),
      );
  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        'red_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 0),
        ),
      );
  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'red_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32 * 2),
        ),
      );
  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        'red_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32 * 3),
        ),
      );
  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        'red_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );

  static get fun =>
      PowerPill.col == false ? RedSpriteSheet.runUp : ScaredSriteSheet.scared;
}
