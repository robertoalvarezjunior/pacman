import 'package:bonfire/bonfire.dart';
import 'package:pacman/pacman/pacman.dart';
import 'package:pacman/pill/pill_sprite_sheet.dart';

class PowerPill extends GameDecoration with Sensor {
  PowerPill(Vector2 position)
      : super.withSprite(
          sprite: PillSpriteSheet.powerPill_1,
          position: position,
          size: Vector2(32, 32),
        ) {
    setupSensorArea(
      intervalCheck: 10,
      areaSensor: [
        CollisionArea.circle(
          radius: 4,
          align: Vector2(12, 12),
        ),
      ],
    );
  }

  @override
  void onContact(GameComponent component) {
    if (component is Pacman) {
      removeFromParent();
      //_pacmanSpeed();
    }
  }

  @override
  void onContactExit(GameComponent component) {}

  // _pacmanSpeed() {
  //   Pacman.pacmanSpeed = 600;
  //   Future.delayed(
  //     const Duration(seconds: 10),
  //     () => Pacman.pacmanSpeed = 62,
  //   );
  // }
}
