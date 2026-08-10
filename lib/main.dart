import 'package:appforro/shared/routes/approutes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      // ...
    );
  }
}
