class MusicPlayerEntities {
  String songName;
  String songSinger;
  int duration;
  bool isPlaying;

  MusicPlayerEntities(this.songName, this.songSinger, this.duration)
      : isPlaying = false;

  void playMusic() {
    isPlaying = true;
  }

  void pauseMusic() {
    isPlaying = false;
  }
}
