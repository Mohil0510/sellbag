import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier {
  final int id;
  final String name;
  final String image;
  final String prize;
  final String rating;
  final String lineprize;

  bool isFavorite;

  Data({
    this.id,
    this.name,
    this.image,
    this.prize,
    this.rating,
    this.lineprize,
    bool isFavorite = false, 
  });

  void setFavourite(bool isFavorite) {
    this.isFavorite = isFavorite;
  }
}
