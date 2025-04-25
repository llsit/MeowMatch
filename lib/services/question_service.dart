import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/question.dart';

Future<List<Question>> loadQuestions() async {
  final String jsonString = await rootBundle.loadString(
    'assets/data/questions.json',
  );
  final List<dynamic> jsonData = json.decode(jsonString);
  return jsonData.map((q) => Question.fromJson(q)).toList();
}
