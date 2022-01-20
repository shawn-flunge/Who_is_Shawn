


import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:who_is_shawn/design_foundation/app_colors.dart';
import 'package:who_is_shawn/providers/page_provider.dart';
import 'package:who_is_shawn/screens/introduce_screen.dart';
import 'package:who_is_shawn/widgets/wis_app_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  ScrollController scrollController = ScrollController();
  int lastTrailingIndex = 0;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(synchronizeScrollWithIndex);
  }

  void synchronizeScrollWithIndex(){
    int devidedValue = scrollController.offset ~/ MediaQuery.of(context).size.height;

    if(devidedValue != lastTrailingIndex){

      if (devidedValue == 0.0){
      context.read<PageProvider>().setCurrentIndex(0);
      } else if(devidedValue ==1.0){
        context.read<PageProvider>().setCurrentIndex(1);
      } else if(devidedValue ==2.0){
        // Provider.of<PageProvider>(context,listen: false).setCurrentIndex(2);
        context.read<PageProvider>().setCurrentIndex(2);
      } else if(devidedValue ==3.0){
        // Provider.of<PageProvider>(context,listen: false).setCurrentIndex(3);
        context.read<PageProvider>().setCurrentIndex(3);
      }

      lastTrailingIndex = devidedValue;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PageProvider>(context,listen: false).addListener(() {
      scrollController.animateTo(
        MediaQuery.of(context).size.height * Provider.of<PageProvider>(context,listen: false).currentIndex, 
        duration: const Duration(milliseconds: 500), 
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
                    if(index ==0){
                      return IntroduceScreen();
                    }
                    return Container(
                      height: constraints.biggest.height,
                      color: Colors.blue[100*index],
                      child: Text(context.watch<PageProvider>().currentIndex.toString()),
                      // child: Text('sdfsdfsd'),
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
