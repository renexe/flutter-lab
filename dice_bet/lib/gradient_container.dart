import 'package:flutter/material.dart';

import 'package:dice_bet/dice_roller.dart';

const gradientBegin = Alignment.topLeft;
const gradientEnd = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colorBegin, this.colorEnd, {super.key});

  final Color colorBegin;
  final Color colorEnd;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: gradientBegin,
          end: gradientEnd,
          colors: [
            colorBegin,
            colorEnd,
          ],
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
