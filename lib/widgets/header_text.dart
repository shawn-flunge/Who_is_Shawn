import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_shawn/providers/page_provider.dart';
import 'package:who_is_shawn/widgets/decorations/header_text_decoration.dart';

class HeaderText extends StatefulWidget {
  final String title;
  final int index;
  const HeaderText({ Key? key, required this.title, required this.index}) : super(key: key);

  @override
  _HeaderTextState createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<PageProvider>().currentIndex;
    return InkWell(
      onTap: (){
        context.read<PageProvider>().setCurrentIndex(widget.index);
      },
      child: Container(
        decoration: HeaderTextDecoration(
          isSelected: currentIndex == widget.index
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 36,
            color: currentIndex == widget.index
              ? Colors.black
              : Colors.grey,
            fontWeight: FontWeight.w400
          ),
          ),
      )
    );
  }
}