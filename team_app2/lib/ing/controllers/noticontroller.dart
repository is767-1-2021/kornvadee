import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/ing/models/notimodel.dart';
import 'package:team_app/ing/services/notiservices.dart';

class NotisController {
  final Services service;
  List<Notis> notis = List.empty();
  // List<Todo> todos = [];

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  NotisController(this.service);

  Future<List<Notis>> fectNotis() async {
    onSyncController.add(true);
    notis = await service.getNotis();
    onSyncController.add(false);
    return notis;
  }

  // Future<void> updateTodo(int id, bool completed) async {
  //   await service.updateTodos(id, completed);
  // }
}
