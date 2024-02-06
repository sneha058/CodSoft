import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerHomeScreen extends StatelessWidget{

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF1F0A33) ,
      appBar: AppBar(
        backgroundColor: Color(0xFF482866),
        title: Text("Music Player", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.list_sharp, color: Colors.white,),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.white,)),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            shape: CircleBorder(),
            onPressed: (){
              playSong();
            },
            child : Icon(Icons.play_arrow)
          ),
          FloatingActionButton(
              shape: CircleBorder(),
              onPressed: (){
                pauseSong();
              },
              child : Icon(Icons.pause)
          ),
        ],
      )
      /*ListView.builder(itemCount: 20,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(4,0,4,2),
              decoration: BoxDecoration(
                color: Color(0xFFE7CFFE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(Icons.music_note),
                title: Text("My Music"),
                subtitle: Text("Artists name"),
                trailing: IconButton(onPressed: (){},
                icon: Icon(Icons.play_arrow),),

              ),
            );
          },),*/
    );
  }

  Future<void> playSong() async {
    try {
      await audioPlayer.setAsset('assets/music_player_assets/music/Adele_-_Someone_Like_You.mp3');
      await audioPlayer.play();
    } catch (e) {
      print('Error playing song: $e');
    }
  }

  Future<void> pauseSong() async {
    await audioPlayer.pause();
  }


}