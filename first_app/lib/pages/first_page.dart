import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.agriculture)),
          IconButton(onPressed: () {}, icon: Icon(Icons.bubble_chart)),
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_roll)),
          IconButton(onPressed: () {}, icon: Icon(Icons.travel_explore)),
        ],
      ),
    );
  }
}
