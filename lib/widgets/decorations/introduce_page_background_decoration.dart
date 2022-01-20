

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
    

    Paint paint = Paint();
    paint.color = AppColors.greyMintCream;
    // Rect rect = Rect.fromCircle(center: offset, radius: 100);
    offset = Offset(configuration.size!.width/2, configuration.size!.height/2);
    Rect rect = Rect.fromCenter(center: offset, width: configuration.size!.width/2, height: configuration.size!.height);
    canvas.drawRect(rect, paint);
  }

}