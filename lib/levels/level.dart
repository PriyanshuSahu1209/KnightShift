import 'dart:async';
import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:knightshift/actors/player.dart';

class Level extends World {
  final String levelName;
  Level({required this.levelName});
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(64));

    add(level);

    final spwanPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spwanpoints');

    for(final spwanPoint in spwanPointsLayer!.objects) {
      switch (spwanPoint.class_) {
        case 'Player':
        final player = Player(character: 'Blue', position: Vector2(spwanPoint.x, spwanPoint.y));
        add (player);
        break;
      default: 
      }
    }

    return super.onLoad();
  }
}