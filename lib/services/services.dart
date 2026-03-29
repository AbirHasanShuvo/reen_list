import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:reen_list/model/user_model.dart';

class ApiServices {
  String endpoint = "https://reqres.in/api/users?page=2";

  Future<List<UserModel>> getUsers() async {
    Response response = await get(
      Uri.parse(endpoint),
      headers: {'x-api-key': 'reqres_9cd47b6e3ea7421499907b59483ff960'},
    );
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//provider is here

final userProvider = Provider<ApiServices>((ref) => ApiServices());
final userString = Provider<String>((ref) => 'Hello World');
