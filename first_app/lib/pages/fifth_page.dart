import 'package:flutter/material.dart';

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(7, (index) {
          // gen list วน loop 6 ครั้ง
          return InkWell(
            //inkwell = effect
            onTap: () {
              Navigator.pushNamed(context, '/${index + 1}');
              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //  content: Text('Tap at $index'),
              // ));
              // index start from 0
            },
            child: Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Center(
                child: Text(
                  'Page ${index + 1}',
                  // ชื่อ text ในแต่ละปุ้่ม
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
