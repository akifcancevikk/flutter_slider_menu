import 'package:flutter/material.dart';
import 'package:flutter_slider_menu/menu_dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MenuDashboard(),
    );
  }
}