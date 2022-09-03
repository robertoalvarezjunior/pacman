import 'package:bonfire/bonfire.dart';

class ScaredSriteSheet {
  static Future<SpriteAnimation> get scared => SpriteAnimation.load(
        'scared_ghost.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 0),
        ),
      );
}
