import 'package:flutter/material.dart';
import 'package:plant_app/models/plants.dart';

class FavoritesModel extends ChangeNotifier{

  final _addedToFavorites = <Plant>[];

  List<Plant> get addedToFavorites => List.unmodifiable(_addedToFavorites);

  void addToFavoritesItem(Plant item) {
    _addedToFavorites.add(item);
    notifyListeners();
  }

  void deleteFromFavorites(Plant item) {

    for(int i = 0; i<_addedToFavorites.length; i++){
      if(_addedToFavorites[i].plantID == item.plantID){
        _addedToFavorites.removeAt(i);
      }
    }
    notifyListeners();
  }

}