import 'package:bloc/bloc.dart';
import 'package:codsoft/projects/3.%20Music%20Player/presentation/bloc/music_player_event.dart';
import 'package:codsoft/projects/3.%20Music%20Player/presentation/bloc/music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent,MusicPlayerState>{
  MusicPlayerBloc():super(MusicPlayerInitialState()){
    on<MusicPlayerPlayEvent>((event, emit) => emit(MusicPlayerPlayState()));
    on<MusicPlayerPauseEvent>((event, emit) => emit(MusicPlayerPauseState()));
    on<MusicPlayerChangeEvent>((event, emit) => emit(MusicPlayerChangeState()));
  }

}
