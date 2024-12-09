import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/pages/detail_page.dart';
import 'package:flutter_local_search_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/Detail_Page': (context) => DetailPage(),
      },
      home: HomePage(),
    );
  }
}
