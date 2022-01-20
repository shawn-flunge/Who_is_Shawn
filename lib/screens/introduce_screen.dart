

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:who_is_shawn/providers/page_provider.dart';
import 'package:who_is_shawn/widgets/decorations/introduce_page_background_decoration.dart';
import 'package:provider/provider.dart';
import 'package:who_is_shawn/widgets/extracted_text_by_stream.dart';

class IntroduceScreen extends StatefulWidget {
  const IntroduceScreen({ Key? key }) : super(key: key);

  @override
  _IntroduceScreenState createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints){
        return Container(
          decoration: IntroduceScreenBackgroundDecoration(),
          width: size.width,
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/pngs/shawn.png'),
                const Text(
                  'Who is Shawn?',
                  style: TextStyle(
                    fontFamily: 'Gothic_A1',
                    fontSize: 72
                  ),
                ),
                const SizedBox(height: 50,),
                MaterialButton(
                  color: Colors.red,
                  onPressed: () async{
                    context.read<PageProvider>().startTextStreaming();
                  }
                ),
                ExtractedTextByStream(),

              ],
            ),
          ),
        );
      }
    );
  }
}
 


