import 'dart:convert';

import 'package:sample/home_screen/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<UserModel?> fetchUser() async {
    try {
      const String url = "https://reqres.in/api/users?page=2";
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = jsonDecode(response.body);
        return UserModel.fromJson(result);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
