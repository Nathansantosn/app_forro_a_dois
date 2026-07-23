import 'package:appforro/modules/danceStep/model/dance_step.dart';
import 'package:flutter/material.dart';

class GraduationEntity {
  const GraduationEntity({
    required this.color,
    required this.label,
    required this.danceSteps,
  });

  final Color color;
  final String label;
  final List<DanceStep> danceSteps;
}

List<GraduationEntity> graduations = [
  GraduationEntity(
    color: Colors.yellow,
    label: 'Amarelo',
    danceSteps: danceStepYellow,
  ),
  GraduationEntity(
    color: Colors.blue,
    label: 'Azul',
    danceSteps: danceStepBlue,
  ),
  GraduationEntity(
    color: Colors.red,
    label: 'Vermelho',
    danceSteps: danceStepRed,
  ),
  GraduationEntity(
    color: Colors.orange,
    label: 'Laranja',
    danceSteps: danceStepOrange,
  ),
];
