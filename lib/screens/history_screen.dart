import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/providers/question_provider.dart';
import '../models/hquestion.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionProvider>(context);

    final List<Hquestion> questions = provider.history;
    print(provider.history);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          iconTheme: const IconThemeData(size: 45),
          title: const Text(
            'History',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.delete,
              ),
              iconSize: 25,
              tooltip: 'Delete history',
              splashRadius: 25,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Delete the history?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                provider.deleteHistory();
                                Navigator.pop(context);
                              },
                              child: const Text('DELETE')),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('CANCEL'))
                        ],
                      );
                    });
              },
            )
          ],
        ),
        body: questions.isNotEmpty
            ? ListView.separated(
                itemCount: questions.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final Hquestion question = questions.reversed.toList()[index];
                  return ListTile(
                    title: Text(question.text),
                    subtitle: Text('Part ${question.part}'),
                  );
                },
              )
            : const Center(child: Text('Empty')));
  }
}
