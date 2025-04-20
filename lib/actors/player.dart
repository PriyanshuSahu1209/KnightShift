import 'dart:async';
import 'package:flame/components.dart';
import 'package:knightshift/knightshift.dart';

enum PlayerState { idle, running , attack }

enum PlayerDirection { left, right , up , down , none }

class Player extends SpriteAnimationGroupComponent with HasGameRef <Knightshift> {
    
    String character;
    Player ({super.position , required this.character});
    

    late final SpriteAnimation idleAnimation;
    late final SpriteAnimation runningAnimation;
    late final SpriteAnimation attackAnimation;

    PlayerDirection playerDirection = PlayerDirection.right;
    double moveSpeed = 100;
    Vector2 velocity = Vector2.zero();
    bool isFacingright = true;
    
  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _updatePlayerMovement(dt);
    super.update(dt);
  }
  
  void _loadAllAnimations() {
    idleAnimation = _spriteAnimation(0);
    runningAnimation = _spriteAnimation(1);
    attackAnimation = _spriteAnimation(2);

      // List of all animations  
      animations = {
        PlayerState.idle: idleAnimation,
        PlayerState.running: runningAnimation,
        PlayerState.attack: attackAnimation,

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
  
  void _updatePlayerMovement(double dt) {
    double dirx = 0.0;
    double diry = 0.0;
    switch (playerDirection) {
      case PlayerDirection.left:
        if (isFacingright) {
          flipHorizontallyAroundCenter();
          isFacingright = false;
        }
        current = PlayerState.running;
        dirx -= moveSpeed;
        break;

      case PlayerDirection.right:
        if (!isFacingright) {
          flipHorizontallyAroundCenter();
          isFacingright = true;
        }
        current = PlayerState.running;
        dirx += moveSpeed;
        break;

      case PlayerDirection.up:
        current = PlayerState.running;
        diry = -moveSpeed;
        break;

      case PlayerDirection.down:
        current = PlayerState.running;
        diry = moveSpeed;
        break;

      case PlayerDirection.none:
        current = PlayerState.idle;
        break;
    }

    velocity = Vector2 (dirx, diry);
    position += velocity * dt;
  }
}