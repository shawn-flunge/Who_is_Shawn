

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'package:who_is_shawn/providers/page_provider.dart';

class WisAppBar extends StatefulWidget {
  const WisAppBar({ Key? key }) : super(key: key);

  @override
  _WisAppBarState createState() => _WisAppBarState();
}

class _WisAppBarState extends State<WisAppBar> {

  List<String> titles = [
    'Experience',
    'Ongoing Project',
    'Contact'
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: List.generate(titles.length+1, (index) {
          if(index == 0){
            return Expanded(
              child: Text('Shawn.developer',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          }
          return HeaderText(
            title: titles[index-1],
            index: index-1,
          );
        }),
        // children: <Widget>[
        //   Expanded(
          //   child: Text('Shawn.developer',
          //     style: Theme.of(context).textTheme.headline4,
          //   )
          // ),
          // HeaderText(
          //   title: 'titles[index]',
          //   index: 0,
          // )
        // ],
      ),
    );
  }
}

class HeaderText extends StatefulWidget {
  String title;
  int index;
  // Function() onTap;
  HeaderText({ Key? key, required this.title, required this.index}) : super(key: key);

  @override
  _HeaderTextState createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> with TickerProviderStateMixin{

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.read<PageProvider>().setCurrentIndex(widget.index);
      },
      child: Container(
        decoration: HeaderTextDecoration(isSelected: isSelected),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 36
          ),
        )
      ),
    );
  }
}



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