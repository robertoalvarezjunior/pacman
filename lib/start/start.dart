import 'package:flutter/material.dart';
import 'package:pacman/screen/screen_game.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenGame(),
                ));
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          child: const Text(
            'Play',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
