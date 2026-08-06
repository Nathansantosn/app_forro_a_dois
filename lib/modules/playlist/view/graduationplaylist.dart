import 'package:appforro/modules/playlist/controller/playlistcontroller.dart';
import 'package:appforro/modules/playlist/model/playlistgraduation.dart';
import 'package:appforro/shared/theme/app_text_styles.dart';
import 'package:appforro/shared/theme/applogo.dart';
import 'package:appforro/shared/widgets/custon_button.dart';
import 'package:flutter/material.dart';

class Graduationplaylist extends StatefulWidget {
  const Graduationplaylist({super.key});

  @override
  State<Graduationplaylist> createState() => _Graduationplaylist();
}

class _Graduationplaylist extends State<Graduationplaylist> {
  final Playlistcontroller _controller = Playlistcontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5C00),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5C00),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Playlist", style: AppTextStyles.title(fontSize: 25)),
            const Applogo(),
          ],
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * .80,
            width: MediaQuery.of(context).size.width * .90,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 70),
                itemCount: playlists.length,
                separatorBuilder: (_, __) => const SizedBox(height: 50),
                itemBuilder: (context, index) {
                  final playlist = playlists[index];

                  return CustonButton(
                    textColor: Colors.black,
                    text: playlist.nome,
                    borda: BorderSide(color: playlist.color),
                    color: playlist.color,
                    onPressed: () async {
                      final abriu = await _controller.abrirPlaylist(
                        playlist.url,
                      );

                      debugPrint("Playlist aberta: $abriu");

                      if (!abriu && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Não foi possível abrir a playlist. Verifique se o Spotify está instalado.',
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
