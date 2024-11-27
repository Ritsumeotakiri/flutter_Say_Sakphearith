import 'package:flutter/material.dart';
import 'package:pratice/flutter%20quiz/1%20-%20START%20CODE/1%20-%20START%20CODE/lib/model/quiz.dart';

class ResultItem extends StatelessWidget {
  final Question question;
  final String? userAnswer;
  final int questionNumber;
  final bool isCorrect;
  const ResultItem(
      {required this.isCorrect,
      required this.questionNumber,
      required this.question,
      this.userAnswer,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: isCorrect ? Colors.lightGreen : Colors.red,
                  child: Text('$questionNumber',
                      style: const TextStyle(color: Colors.white)),
                ),
              ),

              //question title
              Text(
                question.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              )
            ],
          ),

          // display all answers
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: question.possibleAnswers.map((answer) {
              bool isAnswerCorrect = answer == question.goodAnswer;
              bool isUserAnswer = answer == userAnswer;

              IconData? icon = isAnswerCorrect ? Icons.check_circle : null;
              Color? iconColor = Colors.lightGreen;
              Color textColor = isUserAnswer
                  ? (isAnswerCorrect ? Colors.lightGreen : Colors.red)
                  : Colors.black;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 4.0),
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: 20,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        answer,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 19,
                          fontWeight: isUserAnswer
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
