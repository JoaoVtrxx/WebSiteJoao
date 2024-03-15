import 'package:flutter/material.dart';
import 'package:flutter_webjoao/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'João Vitor',
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white.withAlpha(180),
              shadowColor: Colors.white,
              elevation: 0,
              titleSpacing: 100,
              toolbarHeight: 65,
              surfaceTintColor: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
