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
        leading:  Icon(
            Icons.list_sharp,
            color: Colors.white,
          ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shuffle,
                color: Colors.white,
              )),
        ],
      ),
      body: ListView.builder(
        itemCount: musicList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {

          MusicPlayerModel currentSong = musicList[index];
          MusicPlayerModel previousSong;
          MusicPlayerModel nextSong;
          int previousIndex = index-1;
          int nextIndex = index+1;

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
                    if (isTileSelected[index] == true){
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<MusicPlayerBloc>(context).add(MusicPlayerChangeEvent());

                                for (int i = 0 ; i< isTileSelected.length; i++){
                                  isTileSelected[i] = false;
                                }

                               /* print(previousIndex);*/
                                isTileSelected[previousIndex] = true;
                               /* print("Previous update in the isSelected list $isTileSelected");*/
                                playSong(previousIndex);
                              },
                              icon: Icon(Icons.skip_previous)),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<MusicPlayerBloc>(context)
                                  .add(MusicPlayerPauseEvent());
                                isTileSelected[index] = !isTileSelected[index];
                                pauseSong();
                              /*print(isTileSelected);*/

                            },
                            icon: Icon(Icons.pause),
                          ),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<MusicPlayerBloc>(context).add(MusicPlayerChangeEvent());
                                for(int i = 0; i<isTileSelected.length; i++){
                                  isTileSelected[i]= false;
                                }
                                isTileSelected[nextIndex] = true;
                                playSong(nextIndex);
                              },
                              icon: Icon(Icons.skip_next)),
                        ],
                      );
                    }
                    else {
                      return IconButton(onPressed: (){
                        BlocProvider.of<MusicPlayerBloc>(context).add(MusicPlayerPlayEvent());
                        if (isTileSelected[index] == true){
                          isTileSelected[index] = !isTileSelected[index];
                          pauseSong();
                        }
                        else {
                          for (int i = 0 ; i< isTileSelected.length ; i++){
                            isTileSelected[i] = false;
                          }
                          isTileSelected[index] = true;
                          playSong(index);
                        }

                      }, icon: Icon(Icons.play_arrow));
                    }
                  },
                )),
          );
        },
      ),
    );
  }

  Future<void> playSong(index) async {
    try {
      /*print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm The index is $index");
      print(isTileSelected);*/
      await audioPlayer.setAsset(musicList[index].musicPath);
      await audioPlayer.play();
    } catch (e) {
      print('Error playing song: $e');
    }
  }

  Future<void> pauseSong() async {
    await audioPlayer.pause();
  }
}
