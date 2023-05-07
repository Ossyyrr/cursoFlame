import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class MyGame extends Game {
  double circlePos = 10;
  @override
  void render(Canvas canvas) {
    // canvas.drawRect(Rect.fromPoints(const Offset(10, 10), const Offset(100, 100)), BasicPalette.red.paint());
    canvas.drawCircle(Offset(circlePos, circlePos), 10, BasicPalette.red.paint());
  }

  @override
  void update(double dt) {
    print('update: $dt');
    circlePos++;
  }
}

void main() {
  runApp(GameWidget(game: MyGame()));
}
