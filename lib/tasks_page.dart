import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  final int counter;

  const TasksPage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Message'),
      ),
      body: Center(
        child: Text(
          'Message Clicks: $counter',
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
