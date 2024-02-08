class MusicPlayerModel {

  final String musicName;

  final String musicSinger;

  final String musicPath;

  MusicPlayerModel({required this.musicName, required this.musicSinger, required this.musicPath});
  }

  List<MusicPlayerModel> musicList = [
  MusicPlayerModel(musicName: "Someone Like You", musicSinger: 'Adele', musicPath: "assets/music_player_assets/music/Adele_-_Someone_Like_You.mp3"),
  MusicPlayerModel(musicName: "Million Years Ago", musicSinger: "Adele", musicPath: "assets/music_player_assets/music/Adele___Million_Years_Ago_Lyric.mp3")
  ];