import 'package:movie/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie/core/usecases/base_usecase.dart';
import 'package:movie/movies/Domain/Entities/movie_details.dart';
import 'package:movie/movies/Domain/Repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase <MovieDetails> {
   BaseMovieRepository baseMovieRepository ; 
   GetMovieDetailsUseCase(this.baseMovieRepository) ;

  @override
  Future<Either<Failure, MovieDetails>> call({parameter}) async{
   return  await baseMovieRepository.getMovieDetails(parameter) ;
    
  }
  
}