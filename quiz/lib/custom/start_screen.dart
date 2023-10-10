import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "YuYu Hakusho Quiz",
          style: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 199, 203, 255),
          ),
        ),
        const SizedBox(height: 36),
        Image.asset("assets/images/yuyu.png", width: 200),
        const SizedBox(height: 36),
        OutlinedButton.icon(
          onPressed: () {
            switchScreen();
          },
          icon: const Icon(
            Icons.play_arrow,
            color: Color.fromARGB(255, 241, 241, 241),
          ),
          label: const Text(
            "Start",
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 241, 241, 241),
            ),
          ),
        ),
      ]),
    );
  }
}
