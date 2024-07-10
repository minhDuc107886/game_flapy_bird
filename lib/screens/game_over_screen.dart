import 'package:flappy_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

import '../game/assets.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = "gameOver";

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "Score: ${game.bird.score}",
              style:  const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            SizedBox(height: 20,),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),

                ),
                child: const Text(
                  'Restart',
                  style:  TextStyle(
                      fontSize: 28,
                    color: Colors.white
                  ),

                ))
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove("gameOver");
    game.resumeEngine();
  }

}

