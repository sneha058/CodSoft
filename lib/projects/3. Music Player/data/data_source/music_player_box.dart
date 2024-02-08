import 'package:codsoft/projects/3.%20Music%20Player/data/model/music_player_model.dart';
import 'package:hive/hive.dart';

class MusicPlayerBox {
  static Box<MusicPlayerModel> getData() => Hive.box('musicplayerbox');
}