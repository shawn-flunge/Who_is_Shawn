

import 'package:flutter/material.dart';

class IntroduceScreen extends StatefulWidget {
  const IntroduceScreen({ Key? key }) : super(key: key);

  @override
  _IntroduceScreenState createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // return Container(
      // width: size.width,
      // height: size.height,

    // );
    return LayoutBuilder(
      builder: (context, constraints){
        return SizedBox(
          width: size.width,
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/pngs/shawn.png'),
                Text('Who is Shawn?')
              ],
            ),
          ),
        );
      }
    );
  }
}