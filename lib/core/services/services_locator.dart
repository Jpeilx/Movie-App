import 'package:get_it/get_it.dart';
import 'package:movie/movies/Data/DataSource/movie_remote_data_source.dart';
import 'package:movie/movies/Data/repository/movie_repository.dart';
import 'package:movie/movies/Domain/Repository/base_movie_repository.dart';
import 'package:movie/movies/Domain/UseCases/get_movie_details_use_case.dart';
import 'package:movie/movies/Domain/UseCases/get_now_playing_movies_use_case.dart';
import 'package:movie/movies/Presentation/Controller/bloc/movie_details_bloc.dart';
import 'package:movie/movies/Presentation/Controller/bloc/movies_bloc.dart';

import '../../movies/Domain/UseCases/get_popular_movies_use_case.dart';
import '../../movies/Domain/UseCases/get_recommendation_movie_use_case.dart';
import '../../movies/Domain/UseCases/get_top_rated_movies_use_case.dart';

final getIt = GetIt.instance; 
class ServicesLocator{
  
  static void init(){
     
    ///BLOC 
    getIt.registerLazySingleton(() => MoviesBloc(getIt() , getIt(),getIt()));
    getIt.registerLazySingleton(() => MovieDetailsBloc(getIt() , getIt()));
    ///USECASES
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt())) ;
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt())) ;
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt())) ;
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt())) ;
    getIt.registerLazySingleton(() => GetRecommendationUseCase(getIt())) ;





    ///REPOSITORY 
    getIt.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(getIt())) ;


    /// DAtA SOURCE 
     getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource() ) ;
  }
}
