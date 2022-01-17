


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts{

  

  static getHeader1({Color? fontColor}){
    return GoogleFonts.gothicA1(
      fontSize: 72,
      color: fontColor
    );
  }


}