import 'package:hive/hive.dart';

part 'question.g.dart';

@HiveType(typeId: 0)
class Question extends HiveObject {
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
  
  Question({
    required this.text,
    required this.topic,
    required this.part,
    this.wasAskedBefore = false,
    this.shouldSay,
  });
}

@HiveType(typeId: 1)
enum Topics {
  @HiveField(0)
  Style,
  @HiveField(1)
  Entertainment,
  @HiveField(2)
  Life,
  @HiveField(3)
  Places,
  @HiveField(4)
  Storytelling,
  @HiveField(5)
  Education,
  @HiveField(6)
  Person,
  @HiveField(7)
  Environment,
}
