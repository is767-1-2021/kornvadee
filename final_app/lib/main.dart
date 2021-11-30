import 'package:final_app/datainput.dart';
import 'package:final_app/date.dart';
import 'package:final_app/listviewexp.dart';
import 'package:final_app/ui.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Date(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(
            color: Colors.green[700],
          ),
          bottomAppBarColor: Colors.green[700]),
      initialRoute: '/view',
      // home: View(),
      routes: <String, WidgetBuilder>{
        '/view': (context) => View(),
        '/input': (context) => Datainput(),
        // '/ui': (context) => UI(),
      },
    );
  }
}
