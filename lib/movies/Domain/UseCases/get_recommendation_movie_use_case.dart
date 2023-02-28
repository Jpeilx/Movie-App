import 'package:movie/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie/core/usecases/base_usecase.dart';
import 'package:movie/movies/Domain/Entities/recommendation_movies.dart';
import 'package:movie/movies/Domain/Repository/base_movie_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<RecommendationMovie>>{
   BaseMovieRepository baseMovieRepository ; 
   GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<RecommendationMovie>>> call({parameter}) async{
     return await baseMovieRepository.getRecommedationMovies(parameter);
    
  }


  
}