import 'package:flame/components.dart';
import 'package:flappy_bird/game/bird_movement.dart';
import 'package:flappy_bird/game/flappy_bird_game.dart';

import '../game/assets.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>{
  Bird();

  @override
  Future<void> onLoad() async{
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    size = Vector2(50, 40);

    current = BirdMovement.midle;
    sprites = {
      BirdMovement.midle: birdMidFlap,
      BirdMovement.up : birdUpFlap,
      BirdMovement.down: birdDownFlap
    };

    position = Vector2(50, gameRef.size.y/2 - size.y/2);
  }
}