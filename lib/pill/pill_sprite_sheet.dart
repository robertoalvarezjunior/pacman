import 'package:bonfire/bonfire.dart';

class PillSpriteSheet {
  static Future<Sprite> get powerPill => Sprite.load(
        'power_pill.png',
        srcPosition: Vector2(0, 0),
      );
  static Future<Sprite> get pill => Sprite.load(
        'pill.png',
        srcPosition: Vector2(0, 0),
      );
}
