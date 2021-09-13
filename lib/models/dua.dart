import 'package:firebase_auth/firebase_auth.dart';

class Dua {
  final String title;
  final String description;
  final int totalCount;

  Dua({
    required this.title,
    required this.description,
    required this.totalCount,
  });

  factory Dua.fromJson(Map<String, dynamic> json) {
    return Dua(
        title: json['title'],
        description: json['description'],
        totalCount: json['totalCount']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'totalCount': totalCount,
      };
}
