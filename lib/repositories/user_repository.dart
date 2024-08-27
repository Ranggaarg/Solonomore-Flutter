import 'package:dio/dio.dart';
import 'package:solonomore_flutter/models/user_model.dart';

class UserRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: "http://192.168.8.100:4100"));

  Future<List<UserModel>> findParty({
    required String rank,
    required String role,
    required int age,
    required String gender,
    required String playStyle,
    required String communicationStyle,
    required String gameMode,
    required List<String> rolesNeeded,
  }) async {
    try {
      final response = await _dio.post("/users/find", data: {
        "rank": rank,
        "role": role,
        "age": age,
        "gender": gender,
        "play_style": playStyle,
        "communication_style": communicationStyle,
        "game_mode": gameMode,
        "roles_needed": rolesNeeded,
      });

      if (response.statusCode == 200) {
        // Assuming the response data is a list of user objects
        List<UserModel> users = (response.data as List)
            .map((user) => UserModel.fromJson(user))
            .toList();
        return users;
      } else {
        print('Failed to find party');
        return [];
      }
    } catch (e) {
      print('Error finding party: $e');
      return [];
    }
  }

  Future<UserModel?> getDataUser(String username) async {
    try {
      final res = await _dio.get("/users/data/$username");
      if (res.statusCode == 200) {
        print(res.data);
        return UserModel.fromJson(res.data['data'][0]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> updateGenderData(String gender, String username) async {
    try {
      final res = await _dio.patch("/users/gender/$username", data: {
        "gender": gender,
      });

      if (res.statusCode == 200) {
        print('Update Data Success');
      } else {
        print('Update Data Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateAgeData(int age, String username) async {
    try {
      final res = await _dio.patch("/users/age/$username", data: {
        "age": age,
      });

      if (res.statusCode == 200) {
        print('Update Data Success');
      } else {
        print('Update Data Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updatePreferenceData(String username, String rank, String role,
      String play_style, String communication_style, String game_mode) async {
    try {
      final res = await _dio.patch("/users/updatePreference/$username", data: {
        "username": username,
        "rank": rank,
        "role": role,
        "play_style": play_style,
        "communication_style": communication_style,
        "game_mode": game_mode,
      });

      if (res.statusCode == 200) {
        print('Update Data Success');
      } else {
        print('Update Data Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
