import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:knightshift/knightshift.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  Knightshift game = Knightshift();
  runApp(GameWidget(game: kDebugMode ? Knightshift() : game));
}