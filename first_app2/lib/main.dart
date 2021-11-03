import 'package:flutter/material.dart';
import 'package:first_app2/models/first_form_model.dart';
import 'package:provider/provider.dart';

import 'pages/fifth_page.dart';
import 'pages/first_page.dart';
import 'pages/fourth_page.dart';
import 'pages/second_page.dart';
import 'pages/seventh_page.dart';
import 'pages/sixth_page.dart';
import 'pages/third_page.dart';

void main() {
//   runApp(const MyApp());
// }

  runApp(
    // 4. ไปที่หน้า main แล้วเพิ่มตรง void main >
    // Mutiprovider เพื่อถ้ามี model ใหม่จะได้เพิ่มเข้ามาได้เลย
    // แล้วต้อง import provider เข้ามาด้วย
    // 5. ไปที่หน้าขารับ สร้าง class consumer เพื่อให้รับค่า (wrap with widget)
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
// change notifier provider รับคำสั่งแล้วเอาไปบอกว่า change ไหนบ้าง

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.amber[200],
            //accentColor: Colors.yellow[100],
            // เป็นการกำหนดสีแบบภาพรวม ว่า overall ให้เปนสีอะไร
            textTheme:
                TextTheme(bodyText2: TextStyle(color: Colors.grey[900]))),
        initialRoute: '/5',
        routes: <String, WidgetBuilder>{
          '/1': (context) => FirstPage(),
          '/2': (context) => SecondPage(),
          '/3': (context) => ThirdPage(),
          '/4': (context) => FourthPage(),
          '/5': (context) => FifthPage(),
          '/6': (context) => SixthPage(),
          '/7': (context) => SeventhPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
