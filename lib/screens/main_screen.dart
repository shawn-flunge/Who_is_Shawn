


import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:who_is_shawn/design_foundation/app_colors.dart';
import 'package:who_is_shawn/providers/page_provider.dart';
import 'package:who_is_shawn/widgets/wis_app_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    // print('width : ${MediaQuery.of(context).size}, ');
    
    return Scaffold(
      // backgroundColor: AppColors.lightCyan,
      body: LayoutBuilder(
        builder: (context, constraints){
          print(constraints.biggest);
          print(MediaQuery.of(context).size);
          return Stack(

            children: <Widget>[
              
              ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index){
                  return Container(
                    height: constraints.biggest.height,
                    color: Colors.blue[100*index],
                    child: Text(context.watch<PageProvider>().currentIndex.toString()),
                  );
                }
              ),
              WisAppBar(),
            ],
          );
        },
      )
    );
  }
}


class MainScreenBackgroundDecoration extends Decoration{
  
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return MainScreenBackgroundDecorationPaint();
  }

  
}

class MainScreenBackgroundDecorationPaint extends BoxPainter{

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    print('Paint : ${configuration.size}');
    
    var paint = Paint();
    paint.strokeWidth = 10;
    paint.color = Colors.red;
    paint.maskFilter = ui.MaskFilter.blur(BlurStyle.normal, 50);

    canvas.drawCircle(Offset(100,100), 100, paint);

  }

}