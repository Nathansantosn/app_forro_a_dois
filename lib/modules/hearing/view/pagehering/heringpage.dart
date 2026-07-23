import 'package:appforro/modules/danceStep/controller/graduationprogres.dart';
import 'package:appforro/modules/danceStep/view/showVideo/showvideopage.dart';
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
      body: ListView.separated(
        itemCount: widget.hearings.length,
        itemBuilder: (_, index) {
          final hearing = widget.hearings[index];
          return CheckboxListTile(
            value: hearing.checked,
            title: Text(hearing.name, style: AppTextStyles.title(fontSize: 15)),
            onChanged: (bool? value) {
              setState(() {
                hearing.checked = value!;
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
                    legenda: hearing.legenda,
                    name: hearing.name,
                    description: hearing.description,
                    youtubeID: hearing.youtubeId,
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
