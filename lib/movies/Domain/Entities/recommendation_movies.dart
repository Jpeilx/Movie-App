import 'package:equatable/equatable.dart';

class RecommendationMovie extends Equatable{
  final String  ? backdropPath ; 
  final int id ; 
 const RecommendationMovie({ required this.id ,  this.backdropPath}) ;
 
  @override
  List<Object?> get props => [id , backdropPath]; 


}