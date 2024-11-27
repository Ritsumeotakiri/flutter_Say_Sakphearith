import 'package:flutter/material.dart';
import 'package:pratice/flutter%20quiz/1%20-%20START%20CODE/1%20-%20START%20CODE/lib/screens/question_screen.dart';
import 'package:pratice/flutter%20quiz/1%20-%20START%20CODE/1%20-%20START%20CODE/lib/screens/result_screen.dart';
import 'package:pratice/flutter%20quiz/1%20-%20START%20CODE/1%20-%20START%20CODE/lib/screens/welcome_screen.dart';
import 'model/quiz.dart';
import 'model/submission.dart';

Color appColor = Colors.blue[400] as Color;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});
  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStarted;
  int currentQuestionIndex = 0;
  late Submission submission;

  @override
  void initState() {
    super.initState();
    submission = Submission(); // Initialize the Submission object
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Builder(builder: (context) {
            switch (_quizState) {
              case QuizState.notStarted:
                return WelcomeScreen(
                    quizTitle: widget.quiz.title,
                    onStart: () {
                      setState(() {
                        _quizState = QuizState.started;
                      });
                    });

              case QuizState.started:
                final currentQuestion =
                    widget.quiz.questions[currentQuestionIndex];
                return QuestionScreen(
                    question: currentQuestion,
                    onFinish: (String userAnswer) {
                      submission.addAnswer(currentQuestion, userAnswer);
                      setState(() {
                        if (currentQuestionIndex <
                            widget.quiz.questions.length - 1) {
                          currentQuestionIndex++;
                        } else {
                          _quizState = QuizState.finished;
                        }
                      });
                    });

              case QuizState.finished:
                int score = submission.getScore();
                return ResultScreen(
                    submission: submission,
                    quiz: widget.quiz,
                    score: score,
                    onRestart: () {
                      setState(() {
                        _quizState = QuizState.notStarted;
                        submission.removeAnswers();
                        currentQuestionIndex = 0;
                      });
                    });
            }
          }),
        ),
      ),
    );
  }
}
