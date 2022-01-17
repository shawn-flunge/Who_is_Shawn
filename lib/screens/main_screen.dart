


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

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // scrollController.addListener(() {
    //   final devidedValue = scrollController.offset / MediaQuery.of(context).size.height;

    //   if (devidedValue <= 0.8){
    //     context.read<PageProvider>().setCurrentIndex(0);
    //   // } else if(0.8 < scrollController.offset / mediaHeight ){
    //   } else if(0.8 < devidedValue && devidedValue <1.8){
    //     context.read<PageProvider>().setCurrentIndex(1);
    //   // } else if(scrollController.offset / mediaHeight == 2){
    //   } else if(1.8 <= devidedValue && devidedValue <2.8){
    //     Provider.of<PageProvider>(context,listen: false).setCurrentIndex(2);
    //   } else if(2.8 <=devidedValue){
    //     Provider.of<PageProvider>(context,listen: false).setCurrentIndex(3);
    //   }

    //  });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PageProvider>(context,listen: false).addListener(() {
      print('asbsdsdsd');
      scrollController.animateTo(
        MediaQuery.of(context).size.height * Provider.of<PageProvider>(context,listen: false).currentIndex, 
        duration: const Duration(milliseconds: 1000), 
        curve: Curves.easeIn
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: LayoutBuilder(
        builder: (context, constraints){
          return Stack(

            children: <Widget>[
              ListView.builder(
                controller: scrollController,
                itemCount: 4,
                itemBuilder: (context, index){
                  return Container(
                    height: constraints.biggest.height,
                    color: Colors.blue[100*index],
                    child: Text(context.watch<PageProvider>().currentIndex.toString()),
                  );
                }
              ),

              const WisAppBar(),
            ],
          );
        },
      )
    );
  }


  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}


