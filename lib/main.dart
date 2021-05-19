import 'package:flutter/material.dart';
import 'package:flutter_todo_pji_app/pages/homePage/home_pageVew.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageView(),
    );
  }
}
