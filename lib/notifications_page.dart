import 'package:flutter/material.dart';

class NotificationLog {
  final String message;
  final DateTime timestamp;

  NotificationLog({required this.message, required this.timestamp});
}

class NotificationsPage extends StatefulWidget {
  final int counter;

  const NotificationsPage({super.key, required this.counter});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<NotificationLog> _notificationLog = [
    NotificationLog(
      message: 'Welcome to the notification log!',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
    ),
    NotificationLog(
      message: 'You have a new message from John Doe.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationLog(
      message: 'Your account has been updated.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
  ];

  void _addNotificationLog(String message) {
    setState(() {
      _notificationLog.add(NotificationLog(
        message: message,
        timestamp: DateTime.now(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Log'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Notifications Clicks: ${widget.counter}',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _notificationLog.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_notificationLog[index].message),
                    subtitle: Text(
                      '${_notificationLog[index].timestamp.hour}:${_notificationLog[index].timestamp.minute}:${_notificationLog[index].timestamp.second}',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNotificationLog('New notification message!');
        },
        tooltip: 'Add new notification',
        child: const Icon(Icons.add),
      ),
    );
  }
}
