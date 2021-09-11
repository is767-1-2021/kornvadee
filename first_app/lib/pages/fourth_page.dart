import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O'
    ];
    final List<int> colorCodes = <int>[700, 400, 100];
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Example'),
        // Listview ทำให้สามารถเลื่อนหน้าจอนึง กล่องก้เพิ่มเข้ามา (สร้างทีละตัวเมื่อกล่องโผล่เข้ามาในจอ)
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(9.0),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.amberAccent[colorCodes[index % 3]],
            // ดึงจาก list colorcodes
            child: Center(
              child: Text('Entry ${entries[index]}'),
              // ดึงข้อความ Entry และ [list entries]
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
