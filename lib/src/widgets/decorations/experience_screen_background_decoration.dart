

import 'package:flutter/material.dart';
import 'package:who_is_shawn/src/design_foundation/app_colors.dart';

class ExperienceScreenBackgroundDecoration extends Decoration{

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _ExperienceScreenBackgroundDecorationBoxPainter();
  }
}

class _ExperienceScreenBackgroundDecorationBoxPainter extends BoxPainter{
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {

    
    
    Rect rect = Rect.fromPoints(offset, Offset(configuration.size!.width, configuration.size!.height));
    Paint paint = Paint()..color=AppColors.yellowMintCream;
    canvas.drawRect(rect, paint);

    Paint paint2 = Paint()..color=AppColors.darkWinterGreen..strokeWidth=10;
    canvas.drawLine(Offset(0, configuration.size!.height/2), Offset(configuration.size!.width, configuration.size!.height/2), paint2);
    
  }
  
}
