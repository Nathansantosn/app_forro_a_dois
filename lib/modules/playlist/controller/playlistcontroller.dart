import 'package:url_launcher/url_launcher.dart';

class Playlistcontroller {
  /// [playlistId] é só o ID, ex: '0h969YYkfU9sgyw1z8vdqL'
  Future<bool> abrirPlaylist(String playlistId) async {
    final appUri = Uri.parse('spotify:playlist:$playlistId');
    final webUri = Uri.parse('https://open.spotify.com/playlist/$playlistId');

    try {
      // 1ª tentativa: abrir direto no app do Spotify
      final abriuNoApp = await launchUrl(
        appUri,
        mode: LaunchMode.externalApplication,
      );
      if (abriuNoApp) return true;
    } catch (_) {
      // segue pro fallback
    }

    try {
      // 2ª tentativa: navegador (funciona mesmo sem o app instalado)
      return await launchUrl(webUri, mode: LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }
}
