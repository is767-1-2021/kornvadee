import 'package:flutter/material.dart';

// cut มาแล้ว import material (library package flutter material) เข้ามา
class SecondPage extends StatelessWidget {
  @override
  // กด Ctrl + . เพื่อดูวิธี error correction
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.mail_outline),
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Here is the text formatted by theme data'),
            Table(
              children: [
                TableRow(children: [
                  Container(
                    child: Text('Number'),
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  Container(
                    child: Text('Name'),
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  Container(
                    child: Text('Gender'),
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ]),
                TableRow(children: [
                  Text('1'),
                  Text('Inging'),
                  Text('Female'),
                ]),
                TableRow(children: [
                  Text('2'),
                  Text('Name 2'),
                  Text('Male'),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
// สร้างเสร็จแล้วอย่าลืมดึงขั้นไปใส่ตรง route ด้านบนด้วย