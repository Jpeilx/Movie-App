import 'package:dartz/dartz.dart';
import 'package:movie/movies/Domain/Entities/movie.dart';
import 'package:movie/movies/Domain/Entities/movie_details.dart';
import '../../../core/error/failure.dart';
import '../Entities/recommendation_movies.dart';

abstract class BaseMovieRepository {
  Future< Either<Failure ,List<Movie>>> getNowPlayingMovies() ; 
  Future< Either<Failure ,List<Movie>>> getPopularMovies() ; 
  Future< Either<Failure ,List<Movie>>>getTopRatedMovies() ; 
  Future< Either<Failure ,MovieDetails >> getMovieDetails(int id) ; 
  Future< Either<Failure ,List<RecommendationMovie>>> getRecommedationMovies(int id) ; 

}
