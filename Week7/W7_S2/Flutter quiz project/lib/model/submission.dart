import 'quiz.dart';

class Answer {
  Question question;
  String userAnswer;

  Answer(this.question, this.userAnswer);

  bool isCorrect() {
    return question.goodAnswer == userAnswer;
  }
}

class Submission {
  List<Answer> answers = [];

  //calculate the total score by counting number of correct answers
  int getScore() {
    int score = 0;
    for (Answer answer in answers) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
    // return answers.where((a) => a.isCorrect()).length;
  }

  Answer? getAnswerFor(Question question) {
    // consider condition that might be or not be any answers
    // can have answers or null
    for (Answer goodAnswer in answers) {
      if (question == goodAnswer.question) {
        return goodAnswer;
      }
    }
    return null;
  }

  void removeAnswers() {
    answers.clear();
  }

  void addAnswer(Question question, String answer) {
    Answer? existingAnswer = getAnswerFor(question);
    // update the existing answer
    if (existingAnswer != null) {
      existingAnswer.userAnswer = answer;
    } else {
      answers.add(Answer(question, answer));
    }
  }
}
