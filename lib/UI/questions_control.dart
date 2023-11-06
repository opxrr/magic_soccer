import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';

class QuestionsControl {
  List<Map<String, String>> questions = [];
  int currentQuestionIndex = 0;

  Future<void> loadQuestions() async {
    String data = await rootBundle.loadString('assets/text/qText.txt');
    List<String> lines = data.split('*');
    for (String line in lines) {
      List<String> parts = line.split('#');
      if (parts.length == 2) {
        questions.add({
          'question': parts[0],
          'answer': parts[1],
        });
      }
    }
  }

  // Get a random question from the loaded questions.
  Map<String, String>? getRandomQuestion() {
    if (questions.isEmpty) return null;
    final random = Random();
    currentQuestionIndex = random.nextInt(questions.length);
    return questions[currentQuestionIndex];
  }

  // Check if the user's answer matches the correct answer.
  bool isAnswerCorrect(String userAnswer) {
    if (currentQuestionIndex < 0 || currentQuestionIndex >= questions.length) {
      return false;
    }
    return questions[currentQuestionIndex]['answer'] == userAnswer;
  }
}
