import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pacman/screen/screen_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenGame(),
    );
  }
}