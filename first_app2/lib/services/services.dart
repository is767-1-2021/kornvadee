import 'dart:convert';

import 'package:first_app2/models/todo.dart';
import 'package:http/http.dart';

class HttpServices {
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
}
