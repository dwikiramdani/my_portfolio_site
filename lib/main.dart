import 'package:flutter/material.dart';
import 'package:flutter_portfolio/theme.dart';
import 'package:flutter_portfolio/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const HomeView(),
    );
  }
}
