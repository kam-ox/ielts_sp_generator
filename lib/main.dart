import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'logic/providers/question_provider.dart';
import 'models/hquestion.dart';
import 'models/question.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TopicsAdapter());
  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(HquestionAdapter());

  await Hive.openBox<Question>('part1Questions');
  await Hive.openBox<Question>('part2Questions');
  await Hive.openBox<Question>('part3Questions');
  await Hive.openBox<Hquestion>('history');

  runApp(ChangeNotifierProvider<QuestionProvider>(
      create: (ctx) => QuestionProvider(),
      child: Builder(builder: (context) {
        return MyApp(
            questionProvider:
                Provider.of<QuestionProvider>(context, listen: false));
      })));
}

class MyApp extends StatefulWidget {
  final QuestionProvider questionProvider;
  const MyApp({Key? key, required this.questionProvider}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      QuestionProvider questionProvider = widget.questionProvider;
      Box<Question> box1 = Hive.box<Question>('part1Questions');
      Box<Question> box2 = Hive.box<Question>('part2Questions');
      Box<Question> box3 = Hive.box<Question>('part3Questions');
      if (box1.isEmpty) {
        box1.addAll(questionProvider.part1Questions);
      }
      if (box2.isEmpty) {
        box2.addAll(questionProvider.part2Questions);
      }
      if (box3.isEmpty) {
        box3.addAll(questionProvider.part3Questions);
      }
      questionProvider.setPart1Questions =
          box1.values.toList().cast<Question>();
      questionProvider.setPart2Questions =
          box2.values.toList().cast<Question>();
      questionProvider.setPart3Questions =
          box3.values.toList().cast<Question>();

      questionProvider.setHistory =
          Hive.box<Hquestion>('history').values.toList().cast<Hquestion>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IELTS Speaking Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
