class UserModel {
  final String username;
  final String rank;
  final String role;
  final int age;
  final String gender;
  final String play_style;
  final String communication_style;
  final String game_mode;

  UserModel({
    required this.username,
    required this.rank,
    required this.role,
    required this.age,
    required this.gender,
    required this.play_style,
    required this.communication_style,
    required this.game_mode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      rank: json['rank'],
      role: json['role'],
      age: json['age'],
      gender: json['gender'],
      play_style: json['play_style'],
      communication_style: json['communication_style'],
      game_mode: json['game_mode'],
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      rank: map['rank'] ?? '',
      role: map['role'] ?? '',
      age: map['age'] ?? 0,
      gender: map['gender'] ?? '',
      play_style: map['play_style'] ?? '',
      communication_style: map['communication_style'] ?? '',
      game_mode: map['game_mode'] ?? '',
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'username': username,
      'rank': rank,
      'role': role,
      'age': age,
      'gender': gender,
      'play_style': play_style,
      'communication_style': communication_style,
      'game_mode': game_mode,
    };
  }
  
}
