import 'package:flutter/material.dart';

import '../model/question.dart';
import '../services/question_service.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late Future<List<Question>> _futureQuestions;
  int _currentIndex = 0;
  Map<String, int> _score = {};

  @override
  void initState() {
    super.initState();
    _futureQuestions = loadQuestions();
  }

  void _nextQuestion(String type) {
    _score[type] = (_score[type] ?? 0) + 1;
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("แมวที่เหมาะกับคุณ")),
      body: FutureBuilder<List<Question>>(
        future: _futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text("ไม่สามารถโหลดคำถามได้"));
          }

          final questions = snapshot.data!;
          if (_currentIndex >= questions.length) {
            final result = _score.entries.reduce(
              (a, b) => a.value > b.value ? a : b,
            );
            return Center(
              child: Text(
                "คุณเหมาะกับแมวสายพันธุ์: ${result.key}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          final question = questions[_currentIndex];

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "คำถาม ${_currentIndex + 1}/${questions.length}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ...question.answers.map(
                  (a) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () => _nextQuestion(a.type),
                      child: Text(a.text),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
