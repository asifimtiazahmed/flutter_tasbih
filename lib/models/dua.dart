import 'package:firebase_auth/firebase_auth.dart';

class Dua {
  final String title; //Name of the Dua
  final String description; //The actual dua goes here
  final int totalCount; //This is the total count
  int lastCount; //This is the last time how much was counted here

  Dua({
    required this.title,
    required this.description,
    required this.totalCount,
    this.lastCount = 0,
  });

  factory Dua.fromJson(Map<String, dynamic> json) {
    return Dua(
        title: json['title'],
        description: json['description'],
        totalCount: json['totalCount'],
        lastCount: json['lastCount']);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'totalCount': totalCount,
        'lastCount': lastCount,
      };
}
