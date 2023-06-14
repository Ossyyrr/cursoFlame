import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:pruebasflame/components/circle_position_component.dart';
import 'package:pruebasflame/components/player_sprite_sheet_component.dart';

class MyGame extends FlameGame with KeyboardEvents, HasTappables, HasKeyboardHandlerComponents, HasCollisionDetection {
  // Habilitar los que se usan en cada componente tras el
  // HasTappables permite manejar los eventos de toque mediante componentes
  // HasKeyboardHandlerComponents manejar los eventos de teclado mediante componentes

  @override
  Future<void> onLoad() async {
    add(ScreenHitbox()); // HitBox en los bordes de la pantalla
    add(PlayerSpriteSheetComponent());
    add(CirclePositionComponent());
    add(CirclePositionComponent());
    return super.onLoad();
  }
}

void main() {
  runApp(GameWidget(game: MyGame()));
}
