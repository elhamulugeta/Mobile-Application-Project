import 'dart:convert';
import 'package:untitled1/diseases/diseases_model.dart'; 
import 'package:http/http.dart';


class DiseasesRepository{
  String endpoint = 'http://localhost:5000/info';

   Future<List<DiseasesModel>> getDiseases() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200){
      final List result = jsonDecode(response.body);
      return result.map(((e) => DiseasesModel.fromJson(e))).toList();


    }

    else{
      throw Exception(response.reasonPhrase);
    }
  }

    Future<DiseasesModel> addDiseases(Map<String, dynamic> newDiseases) async {
    Response response = await post(
      Uri.parse(endpoint),
      body: newDiseases,
    );

    if (response.statusCode == 204) {
      final newDiseases = jsonDecode(response.body);

      return DiseasesModel.fromJson(newDiseases);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}