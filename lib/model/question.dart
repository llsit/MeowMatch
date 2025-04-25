import 'answer.dart';

class Question {
  final String question;
  final List<Answer> answers;

  Question({required this.question, required this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      answers:
          (json['answers'] as List)
              .map((answer) => Answer.fromJson(answer))
              .toList(),
    );
  }
}
