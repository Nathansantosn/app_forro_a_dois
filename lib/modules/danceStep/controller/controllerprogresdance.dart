import 'package:appforro/modules/danceStep/controller/graduationprogres.dart';
import 'package:appforro/modules/danceStep/model/dance_step.dart';
import 'package:flutter/material.dart';

double getValue(Color color) {
  switch (color) {
    case Colors.yellow:
      return GraduationProgress.nivelYellow / danceStepYellow.length;
    case Colors.blue:
      return GraduationProgress.nivelBlue / danceStepBlue.length;
    case Colors.red:
      return GraduationProgress.nivelRed / danceStepRed.length;
    default:
      return GraduationProgress.nivelOrange / danceStepOrange.length;
  }
}
