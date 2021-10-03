import 'package:flutter/material.dart';
import 'package:team_app/models/notiform.dart';
import 'package:team_app/teamapp/homepage.dart';
import 'package:team_app/teamapp/noti.dart';
import 'package:provider/provider.dart';
import 'package:team_app/teamapp/notiinput.dart';
import 'package:team_app/teamapp/statistics.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotiformModel(),
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
      home: Notifications(),
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomeScreen(),
        '/noti': (context) => Notifications(),
        '/input': (context) => Notiinput(),
        '/sta': (context) => Statistic(),
      },
    );
  }
}