import 'package:appforro/modules/danceStep/controller/controllershowvideo.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Showvideopage extends StatefulWidget {
  const Showvideopage({
    super.key,
    required this.legenda,
    required this.name,
    required this.youtubeID,
    required this.description,
    required this.color,
  });
  final String legenda;
  final String name;
  final String description;
  final String youtubeID;
  final Color color;
  @override
  State<Showvideopage> createState() => _DanceShowVideoPageState();
}

class _DanceShowVideoPageState extends State<Showvideopage> {
  final controller = ShowVideoController();

  @override
  void initState() {
    super.initState();

    controller.init(widget.youtubeID);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(
          widget.name,
          style: AppTextStyles.title(fontSize: 25),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 16), child: Applogo()),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: YoutubePlayerScaffold(
            controller: controller.youtubeController,
            aspectRatio: 16 / 9,
            builder: (context, player) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16.0,
                children: [
                  player,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Descrição',
                          style: AppTextStyles.title(fontSize: 30),
                        ),
                        Text(
                          widget.legenda,
                          style: AppTextStyles.subtitle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.name,
                      style: AppTextStyles.subtitle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.description,
                      style: AppTextStyles.body(fontSize: 20),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
