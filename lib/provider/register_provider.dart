import 'package:bookapps/models/user.dart';
import 'package:bookapps/services/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class RegistrationViewModel extends ChangeNotifier {
  final Dio _dio = Dio();
  bool _isRegistered = false;

  bool get isRegistered => _isRegistered;

  Future<bool> register(RegistrationData data) async {
    try {
      final response =
          await _dio.post(urlApibooksRegister, data: data.toJson());
      if (response.statusCode == 201) {
        _isRegistered = true;
      } else {
        _isRegistered = false;
      }
    } catch (error) {
      _isRegistered = false;
    }

    if (_isRegistered) {
      notifyListeners(); // Only notify listeners when registration is successful
    }
    return _isRegistered; // Return the registration status
  }
}
