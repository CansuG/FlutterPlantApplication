

import 'package:flutter/material.dart';

import 'my_plants.dart';

class MyPlantModel extends ChangeNotifier{
  final _plantItems = <MyPlant>[];

  // 2
  List<MyPlant> get plantItems => List.unmodifiable(_plantItems);

  // 3
  void deleteItem(int index) {
    _plantItems.removeAt(index);
    notifyListeners();
  }

  // 4
  void addItem(MyPlant item) {
    _plantItems.add(item);
    notifyListeners();
  }

  // 5
  void updateItem(MyPlant item, int index) {
    _plantItems[index] = item;
    notifyListeners();
  }

  // 6
  void wateredItem(int index, bool change) {
    final item = _plantItems[index];
    _plantItems[index] = item.copyWith(isWatered: change);
    notifyListeners();
  }
}