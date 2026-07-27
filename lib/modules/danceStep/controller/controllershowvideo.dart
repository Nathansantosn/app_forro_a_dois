import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ShowVideoController {
  late YoutubePlayerController youtubeController;

  void init(String youtubeID) {
    youtubeController = YoutubePlayerController.fromVideoId(
      videoId: youtubeID,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  void dispose() {
    youtubeController.close();
  }
}
