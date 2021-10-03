import 'package:flutter/material.dart';
import 'package:midterm_app/models/notiform.dart';
import 'package:provider/provider.dart';
import 'teamapp/blankpage.dart';
import 'teamapp/homepage.dart';
import 'teamapp/luck.dart';
import 'teamapp/noti.dart';
import 'teamapp/notiinput.dart';
import 'teamapp/statistics.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotiformModels(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.deepPurple[200],
        scaffoldBackgroundColor: Colors.deepPurple[50],
        primarySwatch: Colors.deepPurple,
      ),
      home: Luck(),
      routes: <String, WidgetBuilder>{
        '/luck': (context) => Luck(),
        '/home': (context) => HomeScreen(),
        '/noti': (context) => Notifications(),
        '/input': (context) => Notiinput(),
        '/sta': (context) => Statistic(),
        '/blank': (context) => blankpage()
      },
    );
  }
}
