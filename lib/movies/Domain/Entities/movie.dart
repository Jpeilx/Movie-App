import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final dynamic id ; 
  final String ?title  ; 
  final String ?backdropPath ; 
  final List<dynamic> genreIds ;
  final String ?overView; 
  
  final dynamic voteAverage ;
  final String releaseDate ;
  const Movie(
   {
    required this.id ,
    required this.title ,
    required this.backdropPath ,
    required this.genreIds ,
    required this.overView ,
    required this.voteAverage,
    required this.releaseDate,
   }
  );
  
  @override
 List<Object?> get props =>  [ id , title , backdropPath , genreIds , overView , voteAverage];
  

}