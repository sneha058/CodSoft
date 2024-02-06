import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'music_player_home_screen.dart';

void main(){
  runApp(MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MusicPlayerApp",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MusicPlayerHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }


}