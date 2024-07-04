import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components/background.dart';
import '../components/ground.dart';

class FlappyBirdGame extends FlameGame{
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
    ]);
  }
}