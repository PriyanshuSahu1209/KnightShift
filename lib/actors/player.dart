import 'dart:async';
import 'package:flame/components.dart';
import 'package:knightshift/knightshift.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent with HasGameRef <Knightshift> {
    
    String character;
    Player ({position, required this.character}) : super(position: position);
    

    late final SpriteAnimation idleAnimation;
    late final SpriteAnimation runningAnimation;


    @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }
  
  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation(0);
    runningAnimation = _spriteAnimation(1);

      // List of all animations  
      animations = {
        PlayerState.idle: idleAnimation,
        PlayerState.running: runningAnimation,
      };

      // Set current animation
      current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(double animationNumber) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Factions/Knights/Troops/Warrior/$character/Warrior_$character.png'), 
      SpriteAnimationData.sequenced (
        amount: 6, 
        stepTime: 0.1, 
        textureSize: Vector2.all(192),
        texturePosition: Vector2(0, (192 * animationNumber)),
        ),
      );
  }
}