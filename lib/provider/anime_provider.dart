import 'package:flutter/material.dart';
import 'package:getapi_using_provider/services/getApi_service.dart';

import '../model/anime_model.dart';

class AnimeController extends ChangeNotifier {
  List<Animemodel> Listdata = [];
  List<Animemodel> get animedata => Listdata;
  bool isloading = false;

  getAnimeData() async {
    isloading = true;

    final response = await ApiService().getAnime();
    Listdata = response!;

    isloading = true;
    notifyListeners();
  }
}
