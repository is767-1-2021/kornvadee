import 'package:first_app/pages/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}
//ใช้ stateful เพื่อให้โชว์ค่าที่เก็บไว้ได้

class _FirstPageState extends State<FirstPage> {
  String? _formData = 'Please click to fill the form';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.agriculture)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  // link icon ไปที่ other page push รับ context, route ที่มาจาก build แล้วใส่ class เข้าไป
                  context,
                  MaterialPageRoute(
                    //material pageroute รับ  route on the fly ต้องใส่ context เข้าไป
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              icon: Icon(Icons.bubble_chart)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
                // pushnamed รับ route
              },
              icon: Icon(Icons.camera_roll)),
          IconButton(onPressed: () {}, icon: Icon(Icons.travel_explore)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20.0), child: Text('$_formData')),
            ElevatedButton(
              onPressed: () async {
                var response = await Navigator.pushNamed(context, '/6');
                if (response != null && !response.toString().isEmpty) {
                  setState(() {
                    _formData = response.toString();
                  });
                }
              },
              child: Text('Fill this form please'),
            ),
          ],
        ),
      ),
    );
  }
}
