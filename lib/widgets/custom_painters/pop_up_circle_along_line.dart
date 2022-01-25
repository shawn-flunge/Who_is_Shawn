

import 'package:flutter/material.dart';

enum HeadingDirection{
  bottomToTop,
  topToBottom
}

class PopUpCircleAlongLine extends CustomPainter{
  final HeadingDirection direction;
  final Animation<double> animation;
  final double radiusOfCircle;
  final Color strokeColor;
  final Color circleColor;

  PopUpCircleAlongLine({
    required this.animation, 
    required this.direction, 
    required this.radiusOfCircle,
    required this.circleColor,
    required this.strokeColor
  }) 
    : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {

    Paint strokePaint = Paint()..color = strokeColor..strokeWidth=5;
    Paint circlePaint = Paint()..color = circleColor;
    
    Offset centerPoint = Offset(size.width/2, size.height/2);
    Offset? destinationPoint;

    if(direction == HeadingDirection.bottomToTop){
      destinationPoint = Offset(size.width/2, size.height/2 - animation.value*100);
    } else{
      destinationPoint = Offset(size.width/2, size.height/2 + animation.value*100);
    }
    
    canvas.drawLine(centerPoint, destinationPoint, strokePaint);
    canvas.drawCircle(destinationPoint, radiusOfCircle * animation.value, circlePaint);

    Path path = Path();
    Paint paint = Paint()..color = Colors.white.withOpacity(animation.value) .. strokeWidth = 3..style = PaintingStyle.stroke;

    path.moveTo(destinationPoint.dx - radiusOfCircle/2, destinationPoint.dy + radiusOfCircle/2);
    path.lineTo(destinationPoint.dx, destinationPoint.dy - radiusOfCircle/3);
    path.lineTo(destinationPoint.dx + radiusOfCircle/2, destinationPoint.dy + radiusOfCircle/2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}