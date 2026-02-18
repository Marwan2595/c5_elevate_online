import 'package:c5_elevate_online/config/di/di.dart';
import 'package:c5_elevate_online/features/home/presentation/screens/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView());
  }
}
