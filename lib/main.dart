import 'package:appforro/modules/danceStep/view/graduation/graduationdance.dart';
import 'package:appforro/modules/hearing/view/graduation/graduationhearing.dart';
import 'package:appforro/modules/home/view/homepage.dart';
import 'package:appforro/modules/login/view/loginpage.dart';
import 'package:appforro/modules/splash/splashpage.dart';
import 'package:appforro/modules/theory/view/theorypage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forró a Dois',
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => SplashPage(),
        '/Login': (_) => Loginpage(),
        '/home': (_) => HomePege(),
        '/graduationdancedriven': (context) => GraduationDance(),
        '/graduationhearing': (context) => Graduationhearing(),
        '/theorypage': (context) => Theorypage(),
      },
    );
  }
}
