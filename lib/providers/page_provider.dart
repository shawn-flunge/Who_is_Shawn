


import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier, DiagnosticableTreeMixin{
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final StreamController<String> _introduceTextStream = StreamController();
  StreamController<String> get introduceTextStream => _introduceTextStream;
  final String _introduceText = '우리는 능동적인 전문가들로 모인 조직입니다. 따라서 직원 모두가 회사의 방향성을 만들어 나아가고 있으며, 각자의 자리에서 리더십을 발휘하고 있습니다. 회사를 발전시키고 싶은 열정과 오너십(Ownership)을 가지고 일하고 있습니다.';
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
        await Future.delayed(const Duration(milliseconds: 100), (){
          _introduceTextStream.add(_introduceText[j]);
        });
      }
    }
  }



}