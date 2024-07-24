import 'package:flutter/material.dart';

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
}

class TasksPage extends StatefulWidget {
  final int counter;

  const TasksPage({super.key, required this.counter});

  @override
  _TasksPageState createState() => _TasksPageState();
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
        title: const Text('Todo List'),
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
