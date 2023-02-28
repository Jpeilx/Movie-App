import 'package:dartz/dartz.dart';
import 'package:movie/core/usecases/base_usecase.dart';
import 'package:movie/movies/Domain/Entities/movie.dart';
import 'package:movie/movies/Domain/Repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase <List<Movie>>{
  BaseMovieRepository baseMovieRepository ; 
 GetTopRatedMoviesUseCase(this.baseMovieRepository) ; 


  @override
  Future< Either<Failure ,List<Movie>>> call ({parameter}) async{
    return await baseMovieRepository.getTopRatedMovies();

  }

}