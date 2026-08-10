import 'package:appforro/modules/danceStep/view/showVideo/showvideopage.dart';
import 'package:appforro/modules/hearing/controller/hearingcontroller.dart';
import 'package:appforro/modules/hearing/model/hearing.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:flutter/material.dart';

class Heringpage extends StatefulWidget {
  const Heringpage({
    super.key,
    required this.onUpdate,
    required this.hearings,
    required this.color,
  });

  final Function(int level) onUpdate;
  final List<Hearing> hearings;
  final Color color;

  @override
  State<Heringpage> createState() => _Heringpage();
}

class _Heringpage extends State<Heringpage> {
  late final HearingController controller;

  @override
  void initState() {
    super.initState();
    controller = HearingController(
      hearings: widget.hearings,
      color: widget.color,
      onUpdate: widget.onUpdate,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _openVideo(Hearing hearing) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Showvideopage(
          legenda: hearing.legenda,
          name: hearing.name,
          description: hearing.description,
          youtubeID: hearing.youtubeId,
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
            Text("Sabatinas", style: AppTextStyles.title(fontSize: 25)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Applogo()],
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder<List<Hearing>>(
        valueListenable: controller.hearingsNotifier,
        builder: (context, hearings, _) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            itemCount: hearings.length,
            itemBuilder: (_, index) {
              final hearing = hearings[index];
              final bool isChecked = hearing.checked;

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
                            controller.toggleCheck(hearing, value),
                      ),
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          splashColor: widget.color.withOpacity(0.2),
                          onTap: () => _openVideo(hearing),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    hearing.name,
                                    style: AppTextStyles.title(fontSize: 15)
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
