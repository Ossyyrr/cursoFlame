import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MySprite extends SpriteComponent {
  MySprite() : super(size: Vector2.all(120));
  double spritePosition = 10;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('gato.png');
    return super.onLoad();
  }

  @override
  void update(double dt) {
    print('update: $dt');
    position = Vector2(spritePosition, spritePosition); // Position from SpriteComponent extension
    spritePosition++;
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(MySprite());
    return super.onLoad();
  }
}

void main() {
  runApp(GameWidget(game: MyGame()));
}
