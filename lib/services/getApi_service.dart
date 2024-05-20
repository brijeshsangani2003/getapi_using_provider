import 'dart:convert';
import 'dart:developer';
import 'package:getapi_using_provider/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../model/anime_model.dart';

class ApiService {
  Future<List<Usermodel>?> getUser() async {
    try {
      var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      );
      var response = await http.get(url, headers: {
        "Authorization": "token",
      });

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        List<Usermodel> userdata =
            responseData.map((e) => Usermodel.fromJson(e)).toList();
        print('userdata ===============> ${userdata}');
        return userdata;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Animemodel>?> getAnime() async {
    try {
      var url = Uri.parse('https://api.jikan.moe/v4/anime');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);

        List<dynamic> responseData = responseBody['data'];
        List<Animemodel> animedata =
            responseData.map((e) => Animemodel.fromJson(e)).toList();
        return animedata;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
