import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:midterm_app/models/notiform.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'การแจ้งเตือน',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple[200],
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Icon(Icons.keyboard_arrow_left_sharp),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notification_add_rounded,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/input');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<NotiformModels>(
                builder: (context, form, child) {
                  return Column(
                    children: [
                      Container(
                        child: Container(
                          child: Text(
                            '${form.alert1}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[50],
                          ),
                          margin: EdgeInsets.all(1.0),
                          padding: EdgeInsets.all(15.0),
                          width: 400,
                        ),
                      ),
                      Container(
                        child: Container(
                          child: Text(
                            '${form.alert2}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[50],
                          ),
                          margin: EdgeInsets.all(1.0),
                          padding: EdgeInsets.all(15.0),
                          width: 400,
                        ),
                      ),
                      Container(
                        child: Container(
                          child: Text(
                            '${form.alert3}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[50],
                          ),
                          margin: EdgeInsets.all(1.0),
                          padding: EdgeInsets.all(15.0),
                          width: 400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'คำสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'ตรวจรางวัล',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'การแจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'บัญชีของฉัน',
          ),
        ],
      ),
    );
  }
}
