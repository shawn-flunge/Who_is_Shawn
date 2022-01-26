

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:who_is_shawn/src/data/dtos/experience_dto.dart';

abstract class ExperienceRepository{
  

  static Future<List<ExperienceDto>> getExperienceList() async{
    String listJson = await rootBundle.loadString('jsons/getExperienceList.json');
    final result = json.decode(listJson);

    List<ExperienceDto> list =[];
    for(var object in result){
      
      list.add(
        ExperienceDto(
          project: object['project'],
          title: object['title'], 
          period: object['period'], 
          content: object['content'],
          type: object['type'] == 'personal' ? ExperienceType.personal : ExperienceType.work
        )
      );
    }

    return list;
  }

}