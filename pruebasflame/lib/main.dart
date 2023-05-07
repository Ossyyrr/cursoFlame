import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:pruebasflame/components/player_sprite_sheet_component.dart';

class MyGame extends FlameGame with KeyboardEvents, HasKeyboardHandlerComponents {
  // HasKeyboardHandlerComponents manejar los eventos de teclado mediante componentes
  @override
  Future<void> onLoad() async {
    add(PlayerSpriteSheetComponent());
    return super.onLoad();
  }

  // @override
  // KeyEventResult onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
  //   super.onKeyEvent(event, keysPressed);
  //   return KeyEventResult.handled;
  // }
}

void main() {
  runApp(GameWidget(game: MyGame()));
}
