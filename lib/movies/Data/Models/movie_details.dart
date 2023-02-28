import 'package:movie/movies/Data/Models/geners_model.dart';
import 'package:movie/movies/Domain/Entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.geners,
      required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage});
  factory MovieDetailsModel.fromjson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        geners: List<GenersModel>.from(
            json['genres'].map((x) => GenersModel.fromjson(x))),
        backdropPath: json["backdrop_path"],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average']);
  }
}
