import 'package:appforro/modules/danceStep/controller/graduationprogres.dart';
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
      body: ListView.separated(
        itemCount: widget.danceSteps.length,
        itemBuilder: (_, index) {
          final danceStep = widget.danceSteps[index];
          return CheckboxListTile(
            value: danceStep.checked,
            title: Text(
              danceStep.name,
              style: AppTextStyles.subtitle(fontSize: 15),
            ),
            onChanged: (bool? value) {
              setState(() {
                danceStep.checked = value!;
                if (value) {
                  if (widget.color == Colors.yellow) {
                    GraduationProgress.nivelYellow++;
                  } else if (widget.color == Colors.blue) {
                    GraduationProgress.nivelBlue++;
                  } else if (widget.color == Colors.red) {
                    GraduationProgress.nivelRed++;
                  } else if (widget.color == Colors.orange) {
                    GraduationProgress.nivelOrange++;
                  }
                } else {
                  if (widget.color == Colors.yellow) {
                    GraduationProgress.nivelYellow--;
                  } else if (widget.color == Colors.blue) {
                    GraduationProgress.nivelBlue--;
                  } else if (widget.color == Colors.red) {
                    GraduationProgress.nivelRed--;
                  } else if (widget.color == Colors.orange) {
                    GraduationProgress.nivelOrange--;
                  }
                }
              });
              widget.onUpdate(0);
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
            },
          );
        },
        separatorBuilder: (_, index) {
          return const Padding(padding: EdgeInsets.all(8.0), child: Divider());
        },
      ),
    );
  }
}
