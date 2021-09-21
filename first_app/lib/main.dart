import 'package:first_app/models/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/fifth_page.dart';
import 'pages/first_page.dart';
import 'pages/fourth_page.dart';
import 'pages/second_page.dart';
import 'pages/sixth_page.dart';
import 'pages/third_page.dart';
import 'pages/seventh_page.dart';
//แล้วก้มา import page ด้วย

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
// ^ start application
//change notifier provider รับคำสั่งแล้วเอาไปบอกว่า change ไหนบ้าง

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // function build คือเรียกค่าบนมือถือ
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.amber[200],
          //accentColor: Colors.yellow[100],
          // เป็นการกำหนดสีแบบภาพรวม ว่า overall ให้เปนสีอะไร
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.grey[900]))),
      initialRoute: '/5',
      // เป็นตัวกำหนดได้ว่าหน้าแรกของแอปจะไปหน้าไหน
      routes: <String, WidgetBuilder>{
        '/1': (context) => FirstPage(),
        //ใส่ add folder เข้ามาให้ไปหา
        '/2': (context) => SecondPage(),
        '/3': (context) => ThirdPage(),
        '/4': (context) => FourthPage(),
        '/5': (context) => FifthPage(),
        '/6': (context) => SixthPage(),
        '/7': (context) => SeventhPage(),
        //ย้าย page ออกไปแล้วอย่าลืมมาสร้าง root ด้วย (import material ใน page ที่ย้ายไปก่อนค่อยมาสร้าง root ที่หน้านี้)
        // ใส่หน้าใหม่อย่าลืม มา set route ด้านบนตรงนี้ด้วย โดยเชื่อมมาด้วย class
        // เวลา reload หน้าที่เพิ่มเข้ามาใหม่ใช้ R (not r)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
// link myhomepage to myhomepagestate

  Image cat = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  Image cat1 = Image.asset(
    'assets/popcat1.png',
    width: 120,
  );

  Image cat2 = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  void _incrementCounter() {
    setState(() {
      cat = cat2;
      //เป็นการสั่งว่าถ้าจะ refresh แล้วให้เก็บค่า >> ต้องใช้ setstate เสมอ
      _counter += 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      cat = cat1;
      //เป็นการสั่งว่าถ้าจะ refresh แล้วให้เก็บค่า >> ต้องใช้ setstate เสมอ
      _counter -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ให้ข้อมูลอยู่ตรง center/ start/end...
          children: <Widget>[
            Container(
              // เอา containter มาช่วยล้อคขนาดกรอบได้
              height: 150.0,
              // ความสูงของกรอบ
              margin: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 100.0),
              // ล้อกตำแหน่งกรอบ (ขนาดจาก... เช่น ห่างจากฝั่งซ้าย 100 )
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.25),
                // สีในขอบ opacity คือความทึบ
                borderRadius: BorderRadius.circular(10.0),
                // ความมนของขอบ
              ),
              child: cat,
            ),

            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            //SubmitButton('ปุ่มแรกของชั้น'),
            //SubmitButton('ปุ่มที่สองของชั้น'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red[300]),
                  onPressed: _decrementCounter,
                  child: Text('Decrease'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green[300]),
                  onPressed: _incrementCounter,
                  child: Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.inventory),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton(this.buttonText);
// ต้องรับค่าตัวหนังสือที่มาจากที่กำหนดมาด้วย (link เข้ามาให้)
  @override
  // @ override เป็นการบอกว่า contribute นี้เราจะเขียนเอง ให้เอา format มา
  Widget build(context) {
    return ElevatedButton(
      child: Text(this.buttonText),
      onPressed: () {
        print('Pressed');
      },
    );
  }
}
