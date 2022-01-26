


import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier, DiagnosticableTreeMixin{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // final StreamController<String> _introduceTextStream = StreamController();
  final StreamController<String> _introduceTextStream = StreamController.broadcast();
  StreamController<String> get introduceTextStream => _introduceTextStream;
  final String _introduceText = 'UI/UX를 연구하고 서비스에 접목하는 Designer-Developer';
  
  List<String?> strs = [];
  bool isStreaming = false;

  void setCurrentIndex(int newIndex){
    _currentIndex = newIndex;
    notifyListeners();
  }

  void startTextStreaming() async{
    if(!isStreaming){
      isStreaming = true;

      for(int j=0; j<_introduceText.length; j++){
        await Future.delayed(const Duration(milliseconds: 50), (){
          _introduceTextStream.add(_introduceText[j]);
        });
      }
    }
  }
}