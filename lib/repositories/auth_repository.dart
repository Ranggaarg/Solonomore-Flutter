import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://192.168.8.100:4100"));

  Future<void> login (String username, String password) async {
      final res = await _dio.post("/auth/login", data: {
        "username" : username,
        "password" : password,
      });
      return res.data;
  }

  Future<void> register(String username, String email, String password) async {
    final res = await _dio.post("/auth/register/", data: {'username' : username, 'email' : email, 'password' : password});
    print(res.data);
    return res.data;
  }
}

