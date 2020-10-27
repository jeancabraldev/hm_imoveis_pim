import 'package:flutter/cupertino.dart';

class PageManager {
  PageManager(this._pageController);

  final PageController _pageController;

  int page = 0;
  //Navegando entre as telas
  void setPage(int value) {
    //Evitando que a mesma tela aparece ao clicá-la
    if (value == page) return;
    page = value;
    _pageController.jumpToPage(value);
  }
}
