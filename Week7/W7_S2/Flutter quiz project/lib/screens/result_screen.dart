import 'package:flutter/material.dart';
import 'package:pratice/flutter%20quiz/1%20-%20START%20CODE/1%20-%20START%20CODE/lib/model/quiz.dart';
import 'package:pratice/flutter%20quiz/1%20-%20START%20CODE/1%20-%20START%20CODE/lib/model/submission.dart';
import 'package:pratice/flutter%20quiz/1%20-%20START%20CODE/1%20-%20START%20CODE/lib/screens/resultWidgets/return_item.dart';
import 'package:pratice/flutter%20quiz/1%20-%20START%20CODE/1%20-%20START%20CODE/lib/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.score,
      required this.quiz,
      required this.submission,
      required this.onRestart,
      super.key});
  final int score;
  final Quiz quiz;
  final Submission submission;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $score on ${quiz.questions.length}!",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: quiz.questions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                final userAnswer = submission.getAnswerFor(question);
                final isCorrect = userAnswer != null && userAnswer.isCorrect();
                return ResultItem(
                  isCorrect: isCorrect,
                  question: question,
                  userAnswer: userAnswer?.userAnswer,
                  questionNumber: index + 1,
                );
              }).toList(),
            ),
          ),
          AppButton(icon: Icons.refresh, 'Retake Quiz', onTap: onRestart)
        ],
      ),
    );
  }
}
