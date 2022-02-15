import 'package:flutter/material.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/pages/main_pages.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trevel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DetailPage(),
    );
  }
}