import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movies/Data/DataSource/movie_remote_data_source.dart';
import 'package:movie/movies/Domain/Entities/movie.dart';
import 'package:movie/movies/Domain/Entities/movie_details.dart';
import 'package:movie/movies/Domain/Entities/recommendation_movies.dart';
import 'package:movie/movies/Domain/Repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource ;
  MovieRepository(this.baseMovieRemoteDataSource) ;
  @override
  Future< Either<Failure ,List<Movie>>> getNowPlayingMovies() async{
    final result = await  baseMovieRemoteDataSource.getNowPlayingMovies() ;
    try{
      return Right(result) ; 
    } on ServerException catch (error){

      return left(ServerFailure(message : error.errorMessageModel.statusMessage)) ;

    }
  }

  @override
  Future< Either<Failure ,List<Movie>>>getPopularMovies() async{
    final result = await  baseMovieRemoteDataSource.getPopularMovies() ;
    try{
      return Right(result) ; 
    } on ServerException catch (error){

      return left(ServerFailure(message : error.errorMessageModel.statusMessage)) ;

    }
  }

  @override
 Future< Either<Failure ,List<Movie>>> getTopRatedMovies() async {
   final result = await  baseMovieRemoteDataSource.getTopRatedMovies() ;
    try{
      return Right(result) ; 
    } on ServerException catch (error){

      return left(ServerFailure(message : error.errorMessageModel.statusMessage)) ;

    }  
}

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id ) async {
      final result = await  baseMovieRemoteDataSource.getMovieDetails(id) ;
    try{
      return Right(result) ; 
    } on ServerException catch (error){

      return left(ServerFailure(message : error.errorMessageModel.statusMessage)) ;

    }  
   
  }

  @override
  Future<Either<Failure, List<RecommendationMovie>>> getRecommedationMovies(int id) async{
     final result = await  baseMovieRemoteDataSource.getRecommedationMovies(id) ;
    try{
      return Right(result) ; 
    } on ServerException catch (error){

      return left(ServerFailure(message : error.errorMessageModel.statusMessage)) ;

    }  
  } 

}