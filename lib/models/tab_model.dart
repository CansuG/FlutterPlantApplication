import 'package:flutter/material.dart';

class TabModel extends ChangeNotifier {

  int selectedTab = 0;


  void goToTab(index) {

    selectedTab = index;

    notifyListeners();
  }


}