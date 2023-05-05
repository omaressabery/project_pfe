import 'package:flutter/material.dart';

class QuestioAnswer extends StatefulWidget {
  const QuestioAnswer({super.key});

  @override
  State<QuestioAnswer> createState() => _QuestioAnswerState();
}

class _QuestioAnswerState extends State<QuestioAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question && Answer'),
      ),
    );
  }
}
