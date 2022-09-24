import 'package:flutter/cupertino.dart';

class HomeViewModelProvider extends ChangeNotifier{
  int _currentPageIndex = 0;

  void changeCurrentIndex(int currentPage){
    _currentPageIndex = currentPage;
    notifyListeners();
  }

  int get currentPageIndex => _currentPageIndex;

}