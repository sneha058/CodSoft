
import 'package:codsoft/projects/3.%20Music%20Player/data/model/music_player_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/music_player_bloc.dart';
import 'music_player_home_screen.dart';

void main() {
  runApp(MusicPlayerApp());
}

class MusicPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MusicPlayerApp",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (context) => MusicPlayerBloc(),
        child: MusicPlayerHomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
