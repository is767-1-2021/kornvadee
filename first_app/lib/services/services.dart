import 'dart:convert';

import 'package:first_app/models/todo.dart';
import 'package:http/http.dart';

class HttpServices {
  Client client = Client();

// สำหรับไปดึงข้อมูลจาก webserver แล้วโยนข้อมูลเข้า todo เพื่อมาเรียกใช้
// สร้าง class ไว้เพื่อเวลาอยากไปเรียกใช้จากที่อื่นเช่น db จะได้แก้ได้ง่าย
  Future<List<Todo>> getTodos() async {
    // async, await คือรอให้ดึงข้อมูลให้เสร็จก่อน ค่อยทำรายการต่อ
    final response = await client.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/todos',
    ));

    // เอา response ไปแปลงค่เปน Todo โดยต้อง check conditional statement ก่อน 200 คือ ok
    if (response.statusCode == 200) {
      var all = Alltodos.fromJson(
        json.decode(response.body),
      );

      return all.todos;
    }
    // ถ้า =! 200 > fail
    throw Exception('Failed to load todos');
  }
}
