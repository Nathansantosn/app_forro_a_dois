import 'package:appforro/modules/danceStep/controller/graduationprogres.dart';
import 'package:appforro/modules/danceStep/model/dance_step.dart';
import 'package:flutter/material.dart';

class DanceController {
  DanceController({
    required List<DanceStep> danceSteps,
    required this.color,
    required this.onUpdate,
  }) : danceStepsNotifier = ValueNotifier(danceSteps);

  final Color color;
  final Function(int level) onUpdate;

  final ValueNotifier<List<DanceStep>> danceStepsNotifier;

  void toggleCheck(DanceStep danceStep, bool? value) {
    danceStep.checked = value ?? false;
    _updateGraduationLevel(danceStep.checked);

    // Reatribui a lista (nova referência) para o ValueNotifier notificar os ouvintes
    danceStepsNotifier.value = List.of(danceStepsNotifier.value);

    onUpdate(0);
  }

  void _updateGraduationLevel(bool increment) {
    final delta = increment ? 1 : -1;
    if (color == Colors.yellow) {
      GraduationProgress.nivelYellow += delta;
    } else if (color == Colors.blue) {
      GraduationProgress.nivelBlue += delta;
    } else if (color == Colors.red) {
      GraduationProgress.nivelRed += delta;
    } else if (color == Colors.orange) {
      GraduationProgress.nivelOrange += delta;
    }
  }

  void dispose() {
    danceStepsNotifier.dispose();
  }
}
