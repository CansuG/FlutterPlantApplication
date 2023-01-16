import 'package:flutter/material.dart';
import 'package:plant_app/models/plants.dart';

class CartModel extends ChangeNotifier{

  final _addedToCart = <Plant>[];

  List<Plant> get addedToCart => List.unmodifiable(_addedToCart);

  void addCartItem(Plant item) {
    _addedToCart.add(item);
    notifyListeners();
  }

  void deleteCartItem(Plant item) {

    for(int i = 0; i<_addedToCart.length; i++){
      if(_addedToCart[i].plantID == item.plantID){
        _addedToCart.removeAt(i);
      }
    }
    notifyListeners();
  }

}