import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayerImageSpriteComponent extends SpriteComponent with KeyboardHandler {
  // KeyboardHandler necesita el HasKeyboardHandlerComponents en el main
  late double screenWidth, screenHeight, centerX, centerY;
  final double spriteWidth = 512, spriteHeight = 512;

  @override
  Future<void> onLoad() async {
    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;
    centerX = (screenWidth / 2) - (spriteWidth / 2);
    centerY = (screenHeight / 2) - (spriteHeight / 2);

    sprite = await Sprite.load('gato.png');
    size = Vector2(spriteWidth, spriteHeight);
    position = Vector2(centerX, centerY);
  }

  @override
  void update(double dt) {
    position = Vector2(centerX, centerY);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    print('keysPressed: $keysPressed');
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp) || keysPressed.contains(LogicalKeyboardKey.keyW)) position = Vector2(centerX, centerY--);
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown) || keysPressed.contains(LogicalKeyboardKey.keyS)) position = Vector2(centerX, centerY++);
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight) || keysPressed.contains(LogicalKeyboardKey.keyD)) position = Vector2(centerX++, centerY);
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) || keysPressed.contains(LogicalKeyboardKey.keyA)) position = Vector2(centerX--, centerY);
    return true;
  }
}
