

import 'package:flutter/material.dart';
import 'package:who_is_shawn/widgets/header_text.dart';

class WisAppBar extends StatefulWidget {
  const WisAppBar({ Key? key }) : super(key: key);

  @override
  _WisAppBarState createState() => _WisAppBarState();
}

class _WisAppBarState extends State<WisAppBar> {

  List<String> titles = [
    'Shawn.developer',
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
        children: List.generate(titles.length, (index) {
          if(index == 0){
            return  Expanded(
              child: Text(
                titles[index],
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold
                ),

              ),
            );
          }
          return HeaderText(
            title: titles[index],
            index: index,
          );
        }),
      ),
    );
  }
}

