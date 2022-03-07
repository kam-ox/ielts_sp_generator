import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:ielts_sp_question_generator/models/hquestion.dart';
import 'package:ielts_sp_question_generator/models/question.dart';

class QuestionProvider extends ChangeNotifier {
  List<Question> _part1Questions = [
    Question(
      text: 'How frequently do you buy shoes?',
      topic: Topics.Style,
      part: 1,
    ),
    Question(
      text: 'Where do you usually buy shoes?',
      topic: Topics.Style,
      part: 1,
    ),
    Question(
      text: 'What is your favorite type of shoes?',
      topic: Topics.Style,
      part: 1,
    ),
    Question(
      text: 'Why do some people have too many shoes?',
      topic: Topics.Style,
      part: 1,
    ),
    Question(
      text: 'Have you ever bought shoes online?',
      topic: Topics.Style,
      part: 1,
    ),
    Question(
      text: 'Do you like wearing comfortable shoes or good-looking ones?',
      topic: Topics.Style,
      part: 1,
    ),
    Question(
      text: 'Are people willing to buy expensive shoes?',
      topic: Topics.Style,
      part: 1,
    ),
    Question(
      text: 'When was the last time you purchased new shoes?',
      topic: Topics.Style,
      part: 1,
    ),
  ];

  List<Question> _part2Questions = [
    Question(
      text: 'Describe a habit your friend has, and you want to develop.',
      part: 2,
      topic: Topics.Storytelling,
      shouldSay: [
        'who your friend is',
        'what habit your friend has',
        'when you notice this habit',
        'and explain why you want to develop this habit.'
      ],
    ),
    Question(
      text: 'Describe a gift you would like to buy for your friend.',
      part: 2,
      topic: Topics.Storytelling,
      shouldSay: [
        'what gift you would like to buy',
        'who you would like to give it to',
        'why you would like to buy a gift for your friend',
        'and explain why you choose that gift.'
      ],
    ),
    Question(
      text: 'Describe a course that impressed you a lot.',
      part: 2,
      topic: Topics.Education,
      shouldSay: [
        'what the course was about',
        'where you took the course',
        'what you learn from this course',
        'and explain why it impressed you a lot.',
      ],
    ),
    Question(
      text: 'Describe a business person you admire',
      part: 2,
      topic: Topics.Person,
      shouldSay: [
        'who this person is',
        'how you know this person',
        'what business the person does',
        'and explain why you consider this person as a successful business person.',
      ],
    ),
  ];

  List<Question> _part3Questions = [
    Question(
      text:
          'How are education priorities today different from those in the past?',
      part: 3,
      topic: Topics.Education,
    ),
    Question(
      text: 'What is your opinion on the way languages are taught in schools?',
      part: 3,
      topic: Topics.Education,
    ),
    Question(
      text: 'How can the type of school you go to affect career success?',
      part: 3,
      topic: Topics.Education,
    ),
    Question(
      text:
          'What changes do you think will happen in the classroom in the near future?',
      part: 3,
      topic: Topics.Education,
    ),
    Question(
      text: 'What causes environmental problems?',
      part: 3,
      topic: Topics.Environment,
    ),
    Question(
      text: 'What should the government do to protect the environment?',
      part: 3,
      topic: Topics.Environment,
    ),
    Question(
      text: 'What should we do to protect the environment?',
      part: 3,
      topic: Topics.Environment,
    ),
    Question(
      text: 'What other measures can you think of to protect the environment?',
      part: 3,
      topic: Topics.Environment,
    ),
    Question(
      text: 'How should we educate children to protect the environment?',
      part: 3,
      topic: Topics.Environment,
    ),
    Question(
      text:
          'What’s the difference between the old and the young as regards environmental protection?',
      part: 3,
      topic: Topics.Environment,
    ),
  ];

  List<Hquestion> _history = [];

  get history => _history;

  set setHistory(List<Hquestion> history) {
    _history = history;
    notifyListeners();
  }

  List<Question> get part1Questions => _part1Questions;
  List<Question> get part2Questions => _part2Questions;
  List<Question> get part3Questions => _part3Questions;

  set setPart1Questions(List<Question> part1Questions) {
    _part1Questions = part1Questions;
    notifyListeners();
  }

  set setPart2Questions(List<Question> part2Questions) {
    _part2Questions = part2Questions;
    notifyListeners();
  }

  set setPart3Questions(List<Question> part3Questions) {
    _part3Questions = part3Questions;
    notifyListeners();
  }

  Question? getRandomQuestion(int part, Question? previousQ) {
    List<Question?> questions = [];
    switch (part) {
      case 1:
        questions =
            part1Questions.where((e) => e.wasAskedBefore == false).toList();
        break;
      case 2:
        questions =
            part2Questions.where((e) => e.wasAskedBefore == false).toList();
        break;
      case 3:
        questions =
            part3Questions.where((e) => e.wasAskedBefore == false).toList();
        break;
    }
    questions.shuffle();
    if (questions.isNotEmpty) {
      if (previousQ != null) {
        return questions.firstWhere((e) => e != previousQ);
      } else {
        return questions.first;
      }
    } else {
      return null;
    }
  }

  void deleteHistory() {
    history.clear();
    Hive.box<Hquestion>('history').clear();
    notifyListeners();
  }

  void returnAnsweredQuestions(int part) {
    switch (part) {
      case 1:
        for (Question question in _part1Questions) {
          question.wasAskedBefore = false;
          question.save();
        }
        break;
      case 2:
        for (Question question in _part2Questions) {
          question.wasAskedBefore = false;
          question.save();
        }
        break;
      case 3:
        for (Question question in _part3Questions) {
          question.wasAskedBefore = false;
          question.save();
        }
        break;
    }
    notifyListeners();
  }
}
