

import 'package:flutter/material.dart';
import 'package:who_is_shawn/design_foundation/app_colors.dart';

class IntroduceScreenBackgroundDecoration extends Decoration{

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _IntroduceScreenBackgroundDecorationBoxPainter();
  }
  
}

class _IntroduceScreenBackgroundDecorationBoxPainter extends BoxPainter{
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {


    // Paint paint2 = Paint();
    // paint2.color = Colors.black;
    // paint2.strokeWidth=5;
    // Rect rect2 = Rect.fromPoints(Offset(0,0), Offset(configuration.size!.width, configuration.size!.height));
    // canvas.drawRect(rect2, paint2);


  
    Paint paint = Paint();
    paint.color = AppColors.greyMintCream;
    // Rect rect = Rect.fromCircle(center: offset, radius: 100);
    offset = Offset(configuration.size!.width/2, configuration.size!.height/2);
    // Rect rect = Rect.fromCenter(center: offset, width: configuration.size!.width/2, height: configuration.size!.height);
    Rect rect = Rect.fromCenter(center: offset, width: configuration.size!.width/2, height: 400);   
    canvas.drawRect(rect, paint);

   
  }

}