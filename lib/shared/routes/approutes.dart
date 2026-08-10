import 'package:appforro/modules/danceStep/view/graduation/graduationdance.dart';
import 'package:appforro/modules/hearing/view/graduation/graduationhearing.dart';
import 'package:appforro/modules/home/view/homepage.dart';
import 'package:appforro/modules/login/view/loginpage.dart';
import 'package:appforro/modules/playlist/view/graduationplaylist.dart';
import 'package:appforro/modules/splash/splashpage.dart';
import 'package:appforro/modules/theory/view/theorypage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._(); // evita instanciar a classe, ela é só um "namespace"

  static const String splash = '/splash';
  static const String login = '/Login';
  static const String home = '/home';
  static const String graduationDanceDriven = '/graduationdancedriven';
  static const String graduationHearing = '/graduationhearing';
  static const String theoryPage = '/theorypage';
  static const String graduationPlaylist = '/graduationplaylist';

  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => SplashPage(),
    login: (_) => Loginpage(),
    home: (_) => HomePege(),
    graduationDanceDriven: (_) => GraduationDance(),
    graduationHearing: (_) => Graduationhearing(),
    theoryPage: (_) => Theorypage(),
    graduationPlaylist: (_) => Graduationplaylist(),
  };
}
