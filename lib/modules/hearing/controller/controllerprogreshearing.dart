import 'package:appforro/modules/hearing/controller/graduationprogreshearing.dart';
import 'package:appforro/modules/hearing/model/hearing.dart';
import 'package:flutter/material.dart';

double getValue(Color color) {
  switch (color) {
    case Colors.yellow:
      return Graduationprogreshearing.nivelYellow / hearingYellow.length;
    case Colors.blue:
      return Graduationprogreshearing.nivelBlue / hearingBlue.length;
    case Colors.red:
      return Graduationprogreshearing.nivelRed / hearingRed.length;
    default:
      return Graduationprogreshearing.nivelOrange / hearingOrange.length;
  }
}
