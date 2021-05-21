import 'package:flutter/cupertino.dart';

import 'package:sellbag/model/item.dart';

class FavoritsModel extends ChangeNotifier {
  List<Data> favoritsList = [];

  get getFavoritsList => favoritsList;

  void addToFavorits(Data favorits) {
    favoritsList.add(favorits);
    notifyListeners();
  }

  void removeToFavorits(Data favorits) {
    favoritsList.remove(favorits);
    notifyListeners();
  }
}


