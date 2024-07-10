import 'dart:ffi';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/configuration.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

import '../game/assets.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks{
  Bird();

  @override
  Future<void> onLoad() async{
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
    current = BirdMovement.midle;
    sprites = {
      BirdMovement.midle: birdMidFlap,
      BirdMovement.up : birdUpFlap,
      BirdMovement.down: birdDownFlap
    };

    add(CircleHitbox());
    add(
        MoveByEffect(
          Vector2(0, Config.gravity),
          EffectController(duration: 0.2, curve: Curves.decelerate),
          onComplete: () => current = BirdMovement.down,
        ));

  }

  void fly(){
   add(
     MoveByEffect(
       Vector2(0, Config.gravity),
       EffectController(duration: 0.15, curve: Curves.decelerate),
       onComplete: () => current = BirdMovement.down,
   ));
   current = BirdMovement.up;
  }


  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints,
      PositionComponent other,
  ){
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
    debugPrint('Collision Detected');
  }

  void gameOver(){
    gameRef.overlays.add("gameOver");
    gameRef.pauseEngine();

    game.isHit = true;
  }

  void reset(){
    position = Vector2(50, gameRef.size.y/2 - size.y/2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
  }
}