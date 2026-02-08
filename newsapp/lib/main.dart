import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/pages/home_page.dart';
import 'package:newsapp/pages/news_app.dart';
import 'package:newsapp/pages/news_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: bgWhite)),
      home: NewsApp(),
      routes: {
        '/homepage': (context) => HomePage(),
        '/newsdetailpage': (context) => NewsDetail(),
      },
    );
  }
}
