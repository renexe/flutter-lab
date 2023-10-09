import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var betResult = 'Make a bet!';
  var currentDiceRoll = 1;

  void rollDice(String bet) {
    const betMap = {
      'odd': [1, 3, 5],
      'even': [2, 4, 6],
    };
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;

      if (betMap[bet]!.contains(currentDiceRoll)) {
        betResult = 'You win!';
      } else {
        betResult = 'You lose!';
      }
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(betResult,
            style: const TextStyle(fontSize: 36, color: Colors.white)),
        const SizedBox(height: 32),
        Image.asset('assets/images/dice-$currentDiceRoll.png', width: 200),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => rollDice('odd'),
              child: const Text(
                'Odd',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => rollDice('even'),
              child: const Text(
                'Even',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
