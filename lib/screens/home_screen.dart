import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import 'history_screen.dart';
import 'question_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.history),
                    onPressed: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (_) => const HistoryScreen(),
                      ),
                    ),
                    iconSize: 40,
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.moon),
                    onPressed: () => print('Theme'),
                    iconSize: 40,
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'Choose a part',
                style: TextStyle(fontSize: 53),
              ),
              const Spacer(),
              Button(
                text: 'PART 1',
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => const QuestionScreen(part: 1),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Button(
                text: 'PART 2',
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => const QuestionScreen(part: 2),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Button(
                text: 'PART 3',
                onPressed: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => const QuestionScreen(part: 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
