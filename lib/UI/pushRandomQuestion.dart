import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';

Future<String> loadAsset(String filePath)async{

  return await rootBundle.loadString(filePath);
}

Map<String, String> extractQuestionsAndAnswers(String filename) {
  final file =  File(filename);

  final lines = file.readAsStringSync().split('*\n');
  final questionMap = <String, String>{};

  for (var line in lines) {
    final parts = line.split(' ? #');
    if (parts.length == 2) {
      final question = parts[0].trim();
      final answer = parts[1].trim();
      questionMap[question] = answer??'';
    }
  }

  return questionMap;
}

Map<String, String> getRandomQuestion(Map<String, String> questionMap) {
  final random = Random();
  final questions = questionMap.keys.toList();
  final randomQuestion = questions[random.nextInt(questions.length)];
  return {'question': randomQuestion, 'answer': questionMap[randomQuestion]!};
}

String getCorrectAnswer(Map<String, String> questionMap, String question) {
  final answer = questionMap[question];
  return answer ?? 'Answer not found';
}
