import 'package:flutter/material.dart';
import 'package:untitled2/screens/home_screen.dart';

import 'constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dharmendra Portfolio',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: elevatedButtonThemeData),
      home: const HomeScreen(),
    );
  }
}
