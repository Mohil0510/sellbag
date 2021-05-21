import 'package:flutter/cupertino.dart';

import 'package:sellbag/model/item.dart';

class CartModel extends ChangeNotifier {
  List<Data> cartList = [];

  get getCartList => cartList;

  void addToCart(Data cart) {
    cartList.add(cart);
    
    notifyListeners();
  }
}
