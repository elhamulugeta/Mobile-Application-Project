import 'dart:convert';
import 'package:untitled1/users/models/users_model.dart';
import 'package:http/http.dart';

class UsersRepository {
  String endpoint = 'http://localhost:5000/login';

  Future<List<UsersModel>> getUser() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => UsersModel.fromJson(e))).toList();
    } 
    
    else {
      throw Exception(response.reasonPhrase);
    }
  }

  
  

  Future<UsersModel> addUser(Map<String, dynamic> newUser) async {
    Response response = await post(
      Uri.parse('http://localhost:5000/signup'),
      body: newUser,
    );

    if (response.statusCode == 200) {
      final newUser = jsonDecode(response.body);

      return UsersModel.fromJson(newUser);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

}

