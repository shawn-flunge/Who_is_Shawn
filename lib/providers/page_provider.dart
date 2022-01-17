


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier, DiagnosticableTreeMixin{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int newIndex){
    _currentIndex = newIndex;
    notifyListeners();
  }
}