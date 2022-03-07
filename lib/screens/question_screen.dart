import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../logic/providers/question_provider.dart';
import '../models/hquestion.dart';
import '../models/question.dart';
import '../widgets/button.dart';

class QuestionScreen extends StatefulWidget {
  final int part;
  const QuestionScreen({Key? key, required this.part}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Question? previousQuestion;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<QuestionProvider>();

    Question? question =
        provider.getRandomQuestion(widget.part, previousQuestion);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          iconTheme: const IconThemeData(size: 45),
          title: Text(
            'Part ${widget.part}',
            style: const TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          actions: [
            if (question == null)
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                              'Return all the previously answered questions of Part ${widget.part}?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  provider.returnAnsweredQuestions(widget.part);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: const Text('RETURN')),
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('CANCEL'))
                          ],
                        );
                      });
                },
                icon: const Icon(CupertinoIcons.restart),
                iconSize: 25,
                splashRadius: 25,
                tooltip: 'Return answered questions',
              ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: question != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      question.text,
                      style: const TextStyle(fontSize: 36),
                      textAlign: TextAlign.center,
                    ),
                    if (widget.part == 2) ...[
                      const SizedBox(height: 15),
                      const Text(
                        'You should say:',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      ...question.shouldSay!
                          .map((e) => Text(
                                '• $e',
                                style: const TextStyle(fontSize: 20),
                              ))
                          .toList(),
                    ],
                    const Spacer(),
                    Center(
                      child: Container(
                        width: 320,
                        height: 50,
                        color: Colors.grey,
                        alignment: Alignment.center,
                        child: const Text('ADS'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(
                      text: 'NEXT',
                      onPressed: () => next(question, provider),
                      icon: Icons.done_outline,
                    ),
                    const SizedBox(height: 15),
                    Button(
                      text: 'SKIP',
                      onPressed: () => skip(question),
                      color: Colors.black,
                      textColor: Colors.white,
                      icon: Icons.skip_next_outlined,
                    ),
                  ],
                )
              : const Center(
                  child: Text('There are no questions left.'),
                ),
        ));
  }

  void next(Question question, QuestionProvider provider) {
    question.wasAskedBefore = true;

    Box<Question> box = Hive.box<Question>('part${widget.part}Questions');

    box.values
        .toList()
        .cast<Question>()
        .firstWhere((element) => element.text == question.text)
        .wasAskedBefore = true;

    box.values
        .toList()
        .cast<Question>()
        .firstWhere((element) => element.text == question.text)
        .save();

    Hquestion hquestion = Hquestion.copyWith(question);
    Hive.box<Hquestion>('history').add(hquestion);

    provider.history.add(hquestion);
    previousQuestion = question;
    setState(() {});
  }

  void skip(Question question) {
    previousQuestion = question;
    setState(() {});
  }
}
