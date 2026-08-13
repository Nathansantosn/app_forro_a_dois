import 'package:appforro/modules/danceStep/controller/dancepagecontroller.dart';
import 'package:appforro/modules/danceStep/model/dance_step.dart';
import 'package:appforro/modules/danceStep/view/showVideo/showvideopage.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:flutter/material.dart';

class DancePage extends StatefulWidget {
  const DancePage({
    super.key,
    required this.onUpdate,
    required this.danceSteps,
    required this.color,
  });

  final Function(int level) onUpdate;
  final List<DanceStep> danceSteps;
  final Color color;

  @override
  State<DancePage> createState() => _DancePageState();
}

class _DancePageState extends State<DancePage> {
  late final DanceController controller;

  @override
  void initState() {
    super.initState();
    controller = DanceController(
      danceSteps: widget.danceSteps,
      color: widget.color,
      onUpdate: widget.onUpdate,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _openVideo(DanceStep danceStep) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Showvideopage(
          legenda: danceStep.legenda,
          name: danceStep.name,
          description: danceStep.description,
          youtubeID: danceStep.youtubeId,
          color: widget.color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Passos", style: AppTextStyles.title(fontSize: 25)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Applogo()],
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder<List<DanceStep>>(
        valueListenable: controller.danceStepsNotifier,
        builder: (context, danceSteps, _) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            itemCount: danceSteps.length,
            itemBuilder: (_, index) {
              final danceStep = danceSteps[index];
              final bool isChecked = danceStep.checked;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: isChecked
                      ? widget.color.withOpacity(0.15)
                      : Colors.grey.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isChecked
                        ? widget.color
                        : Colors.grey.withOpacity(0.3),
                    width: isChecked ? 1.5 : 1,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        activeColor: widget.color,
                        onChanged: (value) =>
                            controller.toggleCheck(danceStep, value),
                      ),
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          splashColor: widget.color.withOpacity(0.2),
                          onTap: () => _openVideo(danceStep),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    danceStep.name,
                                    style: AppTextStyles.subtitle(fontSize: 15)
                                        .copyWith(
                                          decoration: isChecked
                                              ? TextDecoration.lineThrough
                                              : null,
                                          color: isChecked ? Colors.grey : null,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_outline,
                                  color: widget.color,
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(height: 10),
          );
        },
      ),
    );
  }
}
