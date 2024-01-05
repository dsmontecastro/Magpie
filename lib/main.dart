import 'package:flutter/material.dart';

import 'routes/home.dart';
import 'routes/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digi-Bank',
      home: const HomePage(),
      routes: {
        '/page': (context) => const DataPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme.of(context).copyWith(
          elevation: 3.0,
          toolbarHeight: 70,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
        ),
        cardTheme: CardTheme.of(context).copyWith(
          elevation: 7.0,
          surfaceTintColor: Colors.white,
        ),
      ),
    );
  }
}
