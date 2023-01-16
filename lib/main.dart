import 'package:flutter/material.dart';
import 'package:plant_app/root_page.dart';
import 'package:plant_app/screens/launch_screen.dart';
import 'package:provider/provider.dart';
import 'models/cart_model.dart';
import 'models/favorites_model.dart';
import 'models/tab_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LaunchScreen(),
    );
  }

}
