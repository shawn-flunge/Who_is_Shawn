

import 'package:flutter/material.dart';

class HeaderTextDecoration extends Decoration{

  bool isSelected;
  HeaderTextDecoration({required this.isSelected});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _HeaderTextDecorationPainter(isSelected: isSelected);
  }
  
}

class _HeaderTextDecorationPainter extends BoxPainter{

  bool isSelected;

  _HeaderTextDecorationPainter({required this.isSelected});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 1.5;
    if(isSelected){
      canvas.drawLine(
        Offset(offset.dx, offset.dy + configuration.size!.height), 
        Offset(offset.dx + configuration.size!.width, offset.dy + configuration.size!.height), 
        paint
      );
    } 
  }
  
}