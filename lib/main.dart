import 'package:flutter/material.dart';
import 'package:pocketbondhu/pages/home_page.dart';

void main() {
  runApp(PocketBondhuApp());
}

class PocketBondhuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PocketBondhu',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
