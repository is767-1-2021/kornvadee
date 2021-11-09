import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app2/models/todo.dart';
import 'package:first_app2/services/services.dart';

class TodoController {
  final Services service;
  List<Todo> todos = List.empty();
  // List<Todo> todos = [];

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  TodoController(this.service);

  Future<List<Todo>> fectTodos() async {
    onSyncController.add(true);
    todos = await service.getTodos();
    onSyncController.add(false);
    return todos;
  }

  Future<void> updateTodo(int id, bool completed) async {
    await service.updateTodos(id, completed);
  }
}
