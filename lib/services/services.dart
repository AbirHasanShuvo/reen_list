import 'dart:io';
import 'package:http/http.dart';

class ApiServices {
  String endpoint = "https://reqres.in/api/users?page=2";

  getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
    } else {}
  }
}
