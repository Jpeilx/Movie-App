import '../../Domain/Entities/recommendation_movies.dart';

class RecommendationMoviesModel extends  RecommendationMovie{
  const  RecommendationMoviesModel({required super.id,  super.backdropPath});
  factory RecommendationMoviesModel.fromjson(json)=>RecommendationMoviesModel(id: json['id'], backdropPath: json['backdrop_path'] ?? "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg") ;

  
}