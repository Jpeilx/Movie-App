import 'package:equatable/equatable.dart';

class Geners extends Equatable {
   final int id ; 
   final String name ;
   const Geners ({
    required this.id , 
    required this.name
   }) ;
     @override
     List<Object?> get props => [id , name]; 
}