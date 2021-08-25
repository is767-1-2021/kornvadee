import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
// ^ start application

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // function build คือเรียกค่าบนมือถือ
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.amber[200],
          accentColor: Colors.red[300],
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.grey[900]))),
      initialRoute: '/forth',
      // เป็นตัวกำหนดได้ว่าหน้าแรกของแอปจะไปหน้าไหน
      routes: <String, WidgetBuilder>{
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
        '/forth': (context) => FourthPage(),
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

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      // ตัวเริ่มต้นของ tab นับเปน 0,1,2 เช่นถ้า 0 = cloud
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.cloud)),
              Tab(icon: Icon(Icons.beach_access_outlined)),
              Tab(icon: Icon(Icons.brightness_1_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Cloud'),
            ),
            Center(
              child: Text('Umbrella'),
            ),
            Center(
              child: Text('Sunny'),
            ),
          ],
        ),
      ),
    );
  }
}

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
