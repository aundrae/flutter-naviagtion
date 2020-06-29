import 'package:flutter/material.dart';
//Replace with ./components/drawer.dart
import './components/bottom_navigation.dart';
import './screens/testing.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TodoList();
  }
}


