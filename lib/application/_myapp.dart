import 'package:flutter/material.dart';

import '../ui/screen/_screenmain.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SF Pro Display'
      ),
      debugShowCheckedModeBanner: false,
      home: ScreenMain(),
    );
  }
}