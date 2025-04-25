class Answer {
  final String text;
  final String type;

  Answer({required this.text, required this.type});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(text: json['text'], type: json['type']);
  }
}
