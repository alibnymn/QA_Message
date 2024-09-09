import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App QA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 255, 13)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'QA Manage Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _navigateToTotalClicksPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TotalClicksPage(counter: _counter)),
    );
  }

  void _navigateToMessagePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MessagePage(counter: _counter)),
    );
  }

  void _navigateToTasksPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TasksPage(counter: _counter)),
    );
  }

  void _navigateToNotificationsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NotificationsPage(counter: _counter)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(20.0),
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                children: <Widget>[
                  _buildCard(
                    'Total Clicks',
                    '$_counter',
                    Icons.touch_app,
                    Colors.blue,
                    onTap: () => _navigateToTotalClicksPage(context),
                  ),
                  _buildCard(
                    'Messages',
                    '5',
                    Icons.message,
                    Color.fromARGB(255, 255, 115, 0),
                    onTap: () => _navigateToMessagePage(context),
                  ),
                  _buildCard(
                    'Tasks',
                    '3',
                    Icons.assignment_turned_in,
                    Colors.green,
                    onTap: () => _navigateToTasksPage(context),
                  ),
                  _buildCard(
                    'Notifications',
                    '3',
                    Icons.notifications_active,
                    Colors.red,
                    onTap: () => _navigateToNotificationsPage(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon, Color color,
      {VoidCallback? onTap}) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 40.0,
                color: color,
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class MessagePage extends StatefulWidget {
  final int counter;

  const MessagePage({Key? key, required this.counter}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final _searchController = TextEditingController();
  List<Message> _messages = [
    Message(text: 'Person 1', sender: 'You'),
    Message(text: 'Person 2', sender: 'You'),
    Message(text: 'Person 3', sender: 'You'),
    Message(text: 'Person 4', sender: 'You'),
    Message(text: 'Person 5', sender: 'You'),
  ];
  List<Message> _filteredMessages = [];

  @override
  void initState() {
    super.initState();
    _filteredMessages = _messages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QA Message'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Show search bar
              setState(() {
                _searchController.text = '';
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat header
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/50'),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Ali Bunyamnin',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search messages...',
              ),
              onChanged: (query) {
                setState(() {
                  _filteredMessages = _messages.where((message) {
                    return message.text
                        .toLowerCase()
                        .contains(query.toLowerCase());
                  }).toList();
                });
              },
            ),
          ),
          // Chat messages
          // Break or separator (add this)
          Divider(
            thickness: 1.0,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/50'),
                  ),
                  title: Text(
                    _filteredMessages[index].text,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onTap: () {
                    // Navigate to chat page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          message: _filteredMessages[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final Message message;

  const ChatPage({Key? key, required this.message}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  List<Message> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(Message(
          text: _controller.text,
          sender: 'You', // added sender parameter
        ));
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.message.text}'),
      ),
      body: Column(
        children: [
          // Chat header
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/50'),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Ali Bunyamnin',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Break or separator
          Divider(
            thickness: 1.0,
            color: Colors.grey,
          ),
          // Daftar pesan
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: _messages[index].sender == 'You'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _messages[index].sender == 'You'
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      _messages[index].text,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          // Chat input field
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final String sender;

  Message({required this.text, required this.sender});
}

class TasksPage extends StatefulWidget {
  final int counter;

  const TasksPage({super.key, required this.counter});

  @override
  _TasksPageState createState() => _TasksPageState();
}

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
}

class _TasksPageState extends State<TasksPage> {
  final List<Task> _tasks = [
    Task(title: 'Task 1 : Membuat chat page'),
    Task(title: 'Task 2 : Membuat task page'),
    Task(title: 'Task 3 : Membuat notif page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List jobdesk'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tasks[index].title),
            trailing: Checkbox(
              value: _tasks[index].isDone,
              onChanged: (value) {
                setState(() {
                  _tasks[index].isDone = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new task
          setState(() {
            _tasks.add(Task(title: 'New Task'));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

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
              'Notifications: 3',
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
