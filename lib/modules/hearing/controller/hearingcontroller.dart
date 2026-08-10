import 'package:appforro/modules/danceStep/controller/graduationprogres.dart';
import 'package:appforro/modules/hearing/model/hearing.dart';
import 'package:flutter/material.dart';

class HearingController {
  HearingController({
    required List<Hearing> hearings,
    required this.color,
    required this.onUpdate,
  }) : hearingsNotifier = ValueNotifier(hearings);

  final Color color;
  final Function(int level) onUpdate;

  final ValueNotifier<List<Hearing>> hearingsNotifier;

  void toggleCheck(Hearing hearing, bool? value) {
    hearing.checked = value ?? false;
    _updateGraduationLevel(hearing.checked);

    // Reatribui a lista (nova referência) para o ValueNotifier notificar os ouvintes
    hearingsNotifier.value = List.of(hearingsNotifier.value);

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
    hearingsNotifier.dispose();
  }
}
