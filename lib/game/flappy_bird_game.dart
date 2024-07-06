import 'dart:io';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/pip_group.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flutter/material.dart';

import '../components/background.dart';
import '../components/bird.dart';
import '../components/ground.dart';
import 'configuration.dart';

class FlappyBirdGame extends FlameGame{
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
}