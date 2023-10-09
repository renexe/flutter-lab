import 'package:flutter/material.dart';
import 'package:dice_bet/gradient_container.dart';

const backgroundColorBegin = Color.fromARGB(255, 74, 8, 150);
const backgroundColorEnd = Color.fromARGB(255, 29, 120, 194);

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(backgroundColorBegin, backgroundColorEnd),
      ),
    ),
  );
}
