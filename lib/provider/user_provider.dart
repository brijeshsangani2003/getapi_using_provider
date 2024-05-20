import 'package:flutter/material.dart';
import 'package:getapi_using_provider/services/getApi_service.dart';
import '../model/user_model.dart';

class UserController extends ChangeNotifier {
  List<Usermodel> userList = [];
  List<Usermodel> get userdata => userList;
  bool loading = false;

  Future<void> getUserData() async {
    loading = true;

    final response = await ApiService().getUser();
    userList = response!;

    loading = false;
    notifyListeners();
  }
}
