import 'package:ultimate_tasbih_app/models/dua.dart';

///TASBIH LIST will take a single title for the tasbih, a description
///such as the benefit of this list and then the list of dua.

class TasbihList {
  String tasbihListTitle;
  String description; //What this list of dua helps to achieve
  List<Dua> listOfDua = [];
  TasbihList(
      {required this.tasbihListTitle,
      required this.listOfDua,
      this.description = ''});

  factory TasbihList.fromJson(Map<String, dynamic> json) {
    return TasbihList(
        tasbihListTitle: json['tasbihListTitle'],
        description: json['description'],
        listOfDua: json['listOfDua']);
  }

  Map<String, dynamic> toJson() => {
        'tasbihListTitle': tasbihListTitle,
        'description': description,
        'listOfDua': listOfDua,
      };
}
