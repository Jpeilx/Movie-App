import 'package:movie/movies/Domain/Entities/geners.dart';

class GenersModel extends Geners{
  const GenersModel({required super.id, required super.name});
  factory GenersModel.fromjson(Map <String , dynamic>json)  {
     return GenersModel (id: json['id'] , name: json['name']);
  }
   
  
}