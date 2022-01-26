


import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:who_is_shawn/src/data/dtos/experience_dto.dart';
import 'package:who_is_shawn/src/data/repository/experience_repository.dart';

class ExperienceProvider with ChangeNotifier, DiagnosticableTreeMixin{
  
  List<ExperienceDto> _list = [];
  List<ExperienceDto> get list => _list;

  Future<void> fetchData() async{
    _list = await ExperienceRepository.getExperienceList();
    notifyListeners();
  }

  Future<List<ExperienceDto>> fetchData2() async{
    var ss = await ExperienceRepository.getExperienceList();
    notifyListeners();
    return ss; 
  }

}