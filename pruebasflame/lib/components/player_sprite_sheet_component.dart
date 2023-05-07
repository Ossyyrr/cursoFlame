import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class PlayerSpriteSheetComponent extends SpriteAnimationComponent {
  // KeyboardHandler necesita el HasKeyboardHandlerComponents en el main
  late double screenWidth, screenHeight, centerX, centerY;
  final double spriteSheetWidth = 680, spriteSheetHeight = 472; // Valores de la imagen de un dino

  late SpriteAnimation dinoDeadAnimation, dinoIdleAnimation, dinoJumpAnimation, dinoRunAnimation, dinoWalkAnimation;

  @override
  Future<void> onLoad() async {
    final spriteImage = await Flame.images.load('dino.png');
    final spriteSheet = SpriteSheet(image: spriteImage, srcSize: Vector2(spriteSheetWidth, spriteSheetHeight));
    // sprite = spriteSheet.getSprite(0, 0);
    // SpriteAnimation.spriteList(sprites, stepTime: stepTime)

    animation = spriteSheet.createAnimationByLimit(xInit: 0, yInit: 0, step: 8, sizeX: 2, stepTime: 0.1);

    screenWidth = MediaQueryData.fromWindow(window).size.width;
    screenHeight = MediaQueryData.fromWindow(window).size.height;
    centerX = (screenWidth / 2) - (spriteSheetWidth / 2);
    centerY = (screenHeight / 2) - (spriteSheetHeight / 2);

    size = Vector2(spriteSheetWidth, spriteSheetHeight);
    position = Vector2(centerX, centerY);
  }
}

extension CreateAnimationByLimit on SpriteSheet {
  SpriteAnimation createAnimationByLimit({
    // Función para coger sprites de la imagen matriz de sprites
    required int xInit,
    required int yInit,
    required int step,
    required int sizeX,
    required double stepTime,
    bool loop = true,
  }) {
    final List<Sprite> spriteList = [];
    int x = xInit;
    int y = yInit - 1;

    for (var i = 0; i < step; i++) {
      if (y >= sizeX) {
        y = 0;
        x++;
      } else {
        y++;
      }
      spriteList.add(getSprite(x, y));
      print('x: $x, y: $y');
    }
    return SpriteAnimation.spriteList(spriteList, stepTime: stepTime, loop: loop);
  }
}
