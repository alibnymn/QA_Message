import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final int counter;

  const NotificationsPage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Notifications'),
      ),
      body: Center(
        child: Text(
          'Notifications Clicks: $counter',
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
