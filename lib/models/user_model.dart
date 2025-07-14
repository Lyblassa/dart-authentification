// lib/models/user_model.dart

class UserModel {
  final String uid;
  final String pseudo;
  final int xp;
  final int hearts;
  final int gems;
  final String level;
  final int streak;

  UserModel({
    required this.uid,
    required this.pseudo,
    required this.xp,
    required this.hearts,
    required this.gems,
    required this.level,
    required this.streak,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      pseudo: json['pseudo'],
      xp: json['xp'],
      hearts: json['hearts'],
      gems: json['gems'],
      level: json['level'],
      streak: json['streak'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'pseudo': pseudo,
      'xp': xp,
      'hearts': hearts,
      'gems': gems,
      'level': level,
      'streak': streak,
    };
  }
}
