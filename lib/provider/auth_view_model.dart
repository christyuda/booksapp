import 'package:bookapps/models/user_model.dart';
// import 'package:bookapps/services/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  late UserModel user;
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  final Dio dio = Dio();

  Future<bool> login(String email, String password) async {
    try {
      final response = await dio.post(
        'https://bukukitabe-8ece94dbd6dd.herokuapp.com/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        user = UserModel.fromJson(response.data);
        await saveTokenToSharedPreferences(user.token);
        _isLoggedIn = true;
        notifyListeners();
        return true;
      }

      return false;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<void> saveTokenToSharedPreferences(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<void> getTokenFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      user = UserModel(token: token);
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    _isLoggedIn = false;
    notifyListeners();
  }
}
