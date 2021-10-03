import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class blankpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สำนักหวยอื่น'),
      ),
      body: Center(child: Text('รวมสำนักหวยอื่น')),
    );
  }
}
