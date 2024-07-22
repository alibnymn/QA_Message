import 'package:flutter/material.dart';

class TotalClicksPage extends StatelessWidget {
  final int counter;

  const TotalClicksPage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Clicks'),
      ),
      body: Center(
        child: Text(
          'Total Clicks: $counter',
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
