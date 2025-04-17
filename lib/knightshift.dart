import 'dart:async';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:knightshift/levels/level.dart';

class Knightshift extends FlameGame {

  @override
  Color backgroundColor() => const Color(0xFF47ABA9);

  late final CameraComponent cam;

  @override
  final world =  Level();

  @override
  FutureOr<void> onLoad() async {
    
    // Caching all Images
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(world: world, width: 1408, height: 768);
    cam.viewfinder.anchor = Anchor.topLeft;
    
    addAll([cam, world]);



    return super.onLoad();
  }
}