import 'dart:async';

import 'package:first_app/models/todo.dart';
import 'package:first_app/services/services.dart';

class TodoController {
  final HttpServices service;
// สร้าง structure list ว่างเอาไว้

  List<Todo> todos = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  TodoController(this.service);

  Future<List<Todo>> fectTodos() async {
    // ถ้ากำลังดึงข้อมูลอยุ่ = true
    onSyncController.add(true);
    todos = await service.getTodos();
    // ถ้าดึงข้อมูลเสร็จ = false
    onSyncController.add(false);
    // ดึงข้อมูลเสร็จแล้วให้ return ค่ากลับไป
    return todos;
  }
}
