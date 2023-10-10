import 'package:flutter/material.dart';

import 'package:quiz/data/questions.dart';
import 'package:quiz/custom/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summaryData;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly!",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 199, 203, 255),
            ),
          ),
          const SizedBox(height: 36),
          QuestionsSummary(
            summaryData,
          ),
          const SizedBox(height: 36),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh_rounded,
              color: Color.fromARGB(255, 241, 241, 241),
            ),
            label: const Text(
              "Restart the Quiz!",
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 241, 241, 241),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
