import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String randomNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
        backgroundColor: Colors.deepPurple[200],
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/luck');
          },
          child: Icon(Icons.keyboard_arrow_left_sharp),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'เส้นทางเศรษฐี',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.deepPurple[300],
              ),
            ),
            Image.asset(
              'assets/stars.png',
              width: 250,
              height: 100,
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/sta');
                },
                child: Container(
                  child: Text(
                    'สถิติหวยย้อนหลัง 15 ปี',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.deepPurple[100],
              ),
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(15.0),
              width: 320,
              alignment: Alignment.center,
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    randomNumber = (Random().nextInt(1001)).toString();
                  });
                },
                child: Container(
                  child: Text(
                    'เลขเด็ดแนะนำ $randomNumber',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.deepPurple[100],
                  ),
                  margin: EdgeInsets.all(1.0),
                  padding: EdgeInsets.all(15.0),
                  width: 320,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  child: Text(
                    'ข่าวสารเลขเด็ด',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.deepPurple[100],
              ),
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(15.0),
              width: 320,
              alignment: Alignment.center,
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
