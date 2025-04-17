import 'dart:async';
import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:knightshift/actors/player.dart';

class Level extends World {

  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    
    level = await TiledComponent.load('level-mockup.tmx', Vector2.all(64));

    add(level);
    add(Player(character: 'Purple'));

    return super.onLoad();
  }
}