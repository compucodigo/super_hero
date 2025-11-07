import 'dart:convert';

import 'package:http/http.dart' as http show get;
import 'package:superhero_app/data/model/superhero_response.dart';

class Repository {
  Future<SuperheroResponse?> fetchSuperheroInfo(String name) async{
    final response = await http.get(Uri.parse(
      "https://superheroapi.com/api/9eb7e9ef98e8542da35024d92f7ffd56/search/$name"
    ));

    if(response.statusCode== 200){
      var decodedJson = jsonDecode(response.body);
      SuperheroResponse superheroResponse = SuperheroResponse.fromJson(decodedJson);
      return superheroResponse;
    }else{
      return null;
    }
  }
}