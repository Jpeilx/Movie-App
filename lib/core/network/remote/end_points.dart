class EndPoints {
  static const String movieNowPlaying = "/movie/now_playing";
  static const String movieTopRated = "/movie/top_rated";
  static const String moviePopular = "/movie/popular";
  static String movieDetails(int path) {
    return "/movie/$path";
  }
  static String recommendationMovies(int path){
    return "/movie/$path/recommendations" ;
  }
}
