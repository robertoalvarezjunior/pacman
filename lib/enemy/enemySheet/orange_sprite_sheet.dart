import 'package:bonfire/bonfire.dart';

class OrangeSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        'orange_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 0),
        ),
      );
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        'orange_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 32 * 2),
        ),
      );
  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        'orange_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 32 * 3),
        ),
      );
  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        'orange_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 32),
        ),
      );
  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        'orange_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 0),
        ),
      );
  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'orange_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32 * 2),
        ),
      );
  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        'orange_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32 * 3),
        ),
      );
  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        'orange_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );
}
