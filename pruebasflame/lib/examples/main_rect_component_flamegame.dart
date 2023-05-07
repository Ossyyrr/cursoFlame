import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class MyCircle extends PositionComponent {
  MyCircle() : super();

  @override
  Future<void> onLoad() async {
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    // canvas.drawCircle(const Offset(10, 10), 10, BasicPalette.red.paint());
    // canvas.drawRect(Rect.fromCircle(center: const Offset(10, 10), radius: 10), BasicPalette.red.paint());
    canvas.drawRect(Rect.fromPoints(const Offset(10, 10), const Offset(100, 100)), BasicPalette.cyan.paint());
    super.render(canvas);
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    add(MyCircle());
    return super.onLoad();
  }
}

void main() {
  runApp(GameWidget(game: MyGame()));
}
