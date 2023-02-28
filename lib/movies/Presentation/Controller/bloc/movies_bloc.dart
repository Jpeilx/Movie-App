import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/Domain/UseCases/get_now_playing_movies_use_case.dart';
import 'package:movie/movies/Domain/UseCases/get_popular_movies_use_case.dart';
import 'package:movie/movies/Domain/UseCases/get_top_rated_movies_use_case.dart';

import '../../../Domain/Entities/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
  }
  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase();
      result.fold(
        (l) => emit(state.copywith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copywith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: r)),
      );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase();
      result.fold(
        (l) => emit(state.copywith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copywith(
            topRatedState: RequestState.loaded, topRatedMovies: r)),
      );
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase();
      result.fold(
        (l) => emit(state.copywith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copywith(
            popularState: RequestState.loaded, popularMovies: r)),
      );
  }

  
}
