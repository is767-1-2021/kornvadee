import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app2/controllers/todo.dart';
import 'package:first_app2/models/todo.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  final TodoController controller;

  TodoPage({required this.controller});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = List.empty();
  // List<Todo> todos = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
    widget.controller.onSync.listen(
      (bool synState) => setState(() => isLoading = synState),
    );
  }

  void _getTodos() async {
    var newTodos = await widget.controller.fectTodos();

    setState(() {
      todos = newTodos;
    });
  }

  void _updateTodos(int _id, bool _completed) async {
    await widget.controller.updateTodo(_id, _completed);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: todos.isEmpty ? 1 : todos.length,
          itemBuilder: (context, index) {
            if (todos.isEmpty) {
              return Text('Tap Button to fetch Todos');
            }

            return CheckboxListTile(
              // onChanged: (newValue) {
              //   setState(() {
              //     todos[index].completed = newValue!;
              //   });
              // },
              onChanged: (bool? value) {
                setState(() {
                  todos[index].completed = value!;
                  _updateTodos(todos[index].id, value);
                });
              },
              value: todos[index].completed,

              // value: todos[index].completed == null
              //     ? false
              //     : todos[index].completed,
              // onChanged: (bool) async {
              //   setState(() {
              //     widget.controller.updateTodos(todos[index].id);
              //   });
              // },
              title: Text(todos[index].title),
            );
          },
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Todos'),
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodos,
        child: Icon(Icons.add),
      ),
    );
  }
}
