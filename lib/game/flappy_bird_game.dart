import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../components/background.dart';

class FlappyBirdGame extends FlameGame{
  @override
  Future<void> onLoad() async {
    add(Background());
  }
}