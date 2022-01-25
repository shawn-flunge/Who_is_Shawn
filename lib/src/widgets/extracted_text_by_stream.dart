

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_shawn/src/providers/page_provider.dart';

class ExtractedTextByStream extends StatelessWidget {
  ExtractedTextByStream({
    Key? key,
  }) : super(key: key);

  final List<String?> strs =[];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      // stream: introduceTextStream.stream,
      stream: context.watch<PageProvider>().introduceTextStream.stream,
      builder: (context, snapshot){
        strs.add(snapshot.data);

        return Text.rich(
          TextSpan(
            children: List.generate(strs.length, (index){
              return TextSpan(text: strs[index]);
            })
          )
        );
      }
    );
  }
}
