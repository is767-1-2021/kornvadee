import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app2/models/todo.dart';
import 'package:http/http.dart';

abstract class Services {
  Future<List<Todo>> getTodos();
  Future<void> updateTodos(int idl, bool completed);
}

class FirebaseServices extends Services {
  @override
  Future<List<Todo>> getTodos() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('todos').get();
    AllTodos todos = AllTodos.fromSnapshot(snapshot);
    return todos.todos;
  }

  @override
  Future<void> updateTodos(int _id, bool completed) async {
    CollectionReference _ref =
        await FirebaseFirestore.instance.collection('todos');
    FirebaseFirestore.instance
        .collection('todos')
        .where('id', isEqualTo: _id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _ref
            .doc(doc.id)
            .update({'completed': completed})
            .then((value) => print("Todos Updated"))
            .catchError((error) => print("Failed to update Todos : $error"));
      });
    });
  }
}

class HttpServices extends Services {
  Client client = Client();

// สำหรับไปดึงข้อมูลจาก webserver แล้วโยนข้อมูลเข้า todo เพื่อมาเรียกใช้
// สร้าง class ไว้เพื่อเวลาอยากไปเรียกใช้จากที่อื่นเช่น db จะได้แก้ได้ง่าย

  Future<List<Todo>> getTodos() async {
    final response = await client.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/todos',
    ));

    // เอา response ไปแปลงค่เปน Todo โดยต้อง check conditional statement ก่อน 200 คือ ok
    if (response.statusCode == 200) {
      var all = AllTodos.fromJson(
        json.decode(response.body),
      );

      return all.todos;
    }
    throw Exception('Failed to load todos');
  }

  @override
  Future<void> updateTodos(int idl, bool completed) {
    // TODO: implement updateTodos
    throw UnimplementedError();
  }
}
