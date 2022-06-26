import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'logic/process.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hesap Makinesi',
      theme:  ThemeData(scaffoldBackgroundColor: const Color(0xFF1A1A1A)),
      home:   const MyHomePage(),
    );
  }
}
