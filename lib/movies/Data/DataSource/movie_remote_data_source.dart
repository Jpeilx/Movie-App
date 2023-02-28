import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/network/remote/dio_helper/dio_helper.dart';
import 'package:movie/core/network/remote/end_points.dart';
import 'package:movie/core/network/remote/error_message_model.dart';
import 'package:movie/core/utils/app_constant.dart';
import 'package:movie/movies/Data/Models/movie_details.dart';
import 'package:movie/movies/Data/Models/movie_model.dart';
import 'package:movie/movies/Data/Models/recommendation_movie_model.dart';

abstract class BaseMovieRemoteDataSource{
   Future<List<MovieModel>> getNowPlayingMovies();
   Future<List<MovieModel>> getPopularMovies();
   Future<List<MovieModel>> getTopRatedMovies();
   Future<MovieDetailsModel> getMovieDetails( int path );
   Future<List<RecommendationMoviesModel>> getRecommedationMovies( int path );
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource{
  @override
   Future<List<MovieModel>> getNowPlayingMovies() async{
    final response = await DioHelper.getdata(endPoint: EndPoints.movieNowPlaying ,query: {
      "api_key": AppConstance.apiKey,
    } ) ; 
    if (response.statusCode==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromjson(e))) ;
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data)) ;
    }


  }
  
  @override
  Future<List<MovieModel>> getPopularMovies()  async {
    final response = await DioHelper.getdata(endPoint: EndPoints.moviePopular ,query: {
      "api_key": AppConstance.apiKey,
    } ) ; 
    if (response.statusCode==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromjson(e))) ;
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data)) ;
    }
  
  }
  
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await DioHelper.getdata(endPoint: EndPoints.movieTopRated ,query: {
      "api_key": AppConstance.apiKey,
    } ) ; 
    if (response.statusCode==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromjson(e))) ;
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data)) ;
    }

    
  }
  
  @override
  Future<MovieDetailsModel> getMovieDetails(int path ) async {
     final response = await DioHelper.getdata(endPoint: EndPoints.movieDetails(path) ,query: {
      "api_key": AppConstance.apiKey,
    } ) ; 
    if (response.statusCode==200){
      return MovieDetailsModel.fromjson(response.data) ;
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data)) ;
    }
   
  }
  
  @override
  Future<List<RecommendationMoviesModel>> getRecommedationMovies(int path) async{
     final response = await DioHelper.getdata(endPoint: EndPoints.recommendationMovies(path) ,query: {
      "api_key": AppConstance.apiKey,
    } ) ; 
    if (response.statusCode==200){
      return List<RecommendationMoviesModel>.from((response.data['results'] as List).map((e) => RecommendationMoviesModel.fromjson(e))) ;
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromjson(response.data)) ;
    }
   
  }
  

}