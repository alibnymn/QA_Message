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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'QA Manage Home Page'),
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
                    '$_counter',
                    Icons.message,
                    Color.fromARGB(255, 255, 115, 0),
                    onTap: () => _navigateToMessagePage(context),
                  ),
                  _buildCard(
                    'Tasks',
                    '$_counter',
                    Icons.assignment_turned_in,
                    Colors.green,
                    onTap: () => _navigateToTasksPage(context),
                  ),
                  _buildCard(
                    'Notifications',
                    '$_counter',
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

class MessagePage extends StatelessWidget {
//   final int counter;

//   const MessagePage({Key? key, required this.counter}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Total Message'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ScaleTransition(
//               scale: Tween<double>(begin: 0.0, end: 1.0).animate(
//                 CurvedAnimation(
//                   parent: ModalRoute.of(context)!.animation!,
//                   curve: Curves.easeInOut,
//                 ),
//               ),
//               child: Icon(
//                 Icons.message, // Ikon pesan
//                 size: 64.0,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Message Clicks: $counter',
//               style: const TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Klik terus dong ya',
//               style: const TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 24.0), // Spacing below text

//             // IconButton added below the text
//             IconButton(
//               icon: Icon(Icons.arrow_forward),
//               iconSize: 48.0,
//               color: Colors.green,
//               onPressed: () {
//                 // Add functionality for button press here
//                 // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
  final int counter;

  const MessagePage({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QA Message'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
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
          // Chat messages
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with actual message count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/50'),
                  ),
                  title: Text(
                    'Message $index',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  subtitle: Text(
                    'This is a sample message',
                    style: TextStyle(fontSize: 14.0),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Add send message functionality here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TasksPage extends StatelessWidget {
  final int counter;

  const TasksPage({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Tasks'),
      ),
      body: Center(
        child: Text(
          'Total Tasks: $counter',
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

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
          'Total Notifications: $counter',
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
