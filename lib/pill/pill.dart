import 'package:bonfire/bonfire.dart';
import 'package:pacman/interface/score.dart';
import 'package:pacman/pacman/pacman.dart';
import 'package:pacman/pill/pill_sprite_sheet.dart';

class Pill extends GameDecoration with Sensor {
  static int pill = 69;

  Pill(Vector2 position)
      : super.withSprite(
          sprite: PillSpriteSheet.pill,
          position: position,
          size: Vector2(16, 16),
        ) {
    setupSensorArea(
      intervalCheck: 0,
      areaSensor: [
        CollisionArea.circle(
          radius: 2,
          align: Vector2(6, 6),
        ),
      ],
    );
  }

  @override
  void onContact(GameComponent component) {
    if (component is Pacman) {
      Score.score += 10;
      Pill.pill -= 1;
      removeFromParent();
    }
  }

  @override
  void onContactExit(GameComponent component) {}
}
