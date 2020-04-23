import 'package:flutter/material.dart';
import 'package:flutter_avancando/pages/home_page.dart';
import 'package:flutter_avancando/pages/page3_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feeds Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
        // '/article' : (context) => ArticlePage(),
        '/page3' : (context) => Page3Page()
      },
    );
  }
}
