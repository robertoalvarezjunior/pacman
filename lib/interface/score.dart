import 'package:bonfire/base/bonfire_game.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

import 'package:pacman/pacman/pacman.dart';

class Score extends StatefulWidget {
  const Score({Key? key, required this.game}) : super(key: key);

  final BonfireGame game;
  static const overlayKey = 'score';
  static int score = 0;

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  int ponto = 0;
  late async.Timer _score;
  @override
  void initState() {
    _score = async.Timer.periodic(const Duration(microseconds: 100), _ponto);
    super.initState();
  }

  @override
  void dispose() {
    _score.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Score: ${Score.score}',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'Vida: ${Pacman.vida}',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }

  void _ponto(async.Timer timer) {
    if (ponto != Score.score) {
      setState(() {
        ponto = Score.score;
      });
    }
  }
}
