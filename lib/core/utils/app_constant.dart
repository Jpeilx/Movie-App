class AppConstance{
  static const String apiBaseUrl = "https://api.themoviedb.org/3" ;
  static const String apiKey ="8e4f64001fdea3ed534f8011155ef79c" ;
  static const String baseImageUrl ="https://image.tmdb.org/t/p/w500" ; 
  static String imageUrl(String ?path) {
    return "$baseImageUrl$path" ;
  }


}