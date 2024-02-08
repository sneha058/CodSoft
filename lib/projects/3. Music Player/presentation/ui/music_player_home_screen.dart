import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/model/music_player_model.dart';
import '../bloc/music_player_bloc.dart';
import '../bloc/music_player_event.dart';
import '../bloc/music_player_state.dart';

class MusicPlayerHomeScreen extends StatelessWidget {
  AudioPlayer audioPlayer = AudioPlayer();
  List<bool> isTileSelected = List.generate(musicList.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F0A33),
      appBar: AppBar(
        backgroundColor: Color(0xFF482866),
        title: Text(
          "Music Player",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.list_sharp,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: ListView.builder(
        itemCount: musicList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          MusicPlayerModel currentSong = musicList[index];

          return Container(
            margin: EdgeInsets.fromLTRB(4, 0, 4, 2),
            decoration: BoxDecoration(
              color: Color(0xFFE7CFFE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
                leading: Icon(Icons.music_note),
                title: Text(currentSong.musicName),
                subtitle: Text(currentSong.musicSinger),
                trailing: BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {

                        if (isTileSelected[index] == true) {
                          isTileSelected[index] = !isTileSelected[index];
                          pauseSong();
                        } else {
                          for (int i = 0; i < isTileSelected.length; i++) {
                            isTileSelected[i] = false;
                          }
                          isTileSelected[index] = true;
                          playSong(currentSong.musicPath);
                        }

                        /*print(isTileSelected);*/
                        (state is MusicPlayerPauseState)
                            ? BlocProvider.of<MusicPlayerBloc>(context)
                                .add(MusicPlayerPlayEvent())
                            : BlocProvider.of<MusicPlayerBloc>(context)
                                .add(MusicPlayerPauseEvent());
                      },
                      icon: Icon((isTileSelected[index])
                          ? Icons.pause
                          : Icons.play_arrow),
                    );
                  },
                )),
          );
        },
      ),
    );
  }

  Future<void> playSong(path) async {
    try {
      await audioPlayer.setAsset(path);
      await audioPlayer.play();
    } catch (e) {
      print('Error playing song: $e');
    }
  }

  Future<void> pauseSong() async {
    await audioPlayer.pause();
  }
}
