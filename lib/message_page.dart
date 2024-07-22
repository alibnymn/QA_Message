import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  final int counter;

  const MessagePage({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Message'),
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
                  'John Doe',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Chat messages
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual message count
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
