import 'package:hive/hive.dart';

import 'package:ielts_sp_question_generator/models/question.dart';

part 'hquestion.g.dart';

@HiveType(typeId: 3)
class Hquestion {
  @HiveField(0)
  String text;

  @HiveField(1)
  int part;

  @HiveField(2)
  Topics topic;

  @HiveField(3)
  bool wasAskedBefore;

  @HiveField(4)
  List<String>? shouldSay;

  Hquestion({
    required this.text,
    required this.topic,
    required this.part,
    this.wasAskedBefore = false,
    this.shouldSay,
  });

  factory Hquestion.copyWith(Question question) {
    return Hquestion(
      text: question.text,
      part: question.part,
      topic: question.topic,
      wasAskedBefore: question.wasAskedBefore,
      shouldSay: question.shouldSay,
    );
  }
}
