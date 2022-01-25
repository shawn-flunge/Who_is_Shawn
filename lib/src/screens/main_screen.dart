
import 'package:flutter/material.dart';



import 'package:provider/provider.dart';
import 'package:who_is_shawn/src/providers/page_provider.dart';
import 'package:who_is_shawn/src/screens/introduce_screen.dart';
import 'package:who_is_shawn/src/widgets/wis_app_bar.dart';
import 'package:who_is_shawn/src/screens/experience_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  ScrollController scrollController = ScrollController();
  int lastTrailingIndex = 0;

  int offsetWantToGo = 0;

  List<Widget> screens = [
    const ExperienceScreen(),
    const IntroduceScreen(),
    
    const IntroduceScreen(),
    const ExperienceScreen()
  ];


  @override
  void initState() {
    super.initState();

    scrollController.addListener(synchronizeScrollWithIndex);
  }

  void synchronizeScrollWithIndex(){
    int devidedValue = scrollController.offset ~/ MediaQuery.of(context).size.height;
    int currentIndex = context.read<PageProvider>().currentIndex;

    if(devidedValue != lastTrailingIndex){

      if (devidedValue == 0.0){
        if(devidedValue == currentIndex) context.read<PageProvider>().setCurrentIndex(0);
        if(lastTrailingIndex == currentIndex) context.read<PageProvider>().setCurrentIndex(0);
      } else if(devidedValue ==1.0){
        if(devidedValue == currentIndex) context.read<PageProvider>().setCurrentIndex(1);
        if(lastTrailingIndex == currentIndex) context.read<PageProvider>().setCurrentIndex(1);
      } else if(devidedValue ==2.0){
        if(devidedValue == currentIndex) context.read<PageProvider>().setCurrentIndex(2);
        if(lastTrailingIndex == currentIndex) context.read<PageProvider>().setCurrentIndex(2);
      } else if(devidedValue ==3.0){
        if(devidedValue == currentIndex) context.read<PageProvider>().setCurrentIndex(3);
        if(lastTrailingIndex == currentIndex) context.read<PageProvider>().setCurrentIndex(3);
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


              // ListView.builder(
              //   // shrinkWrap: true,
              //   controller: scrollController,
              //   itemCount: 4,
              //   itemBuilder: (context, index){
              //     if(index ==0){
              //       print('index == 0');
              //       return const IntroduceScreen();
              //     }
              //     return Container(
              //       height: constraints.biggest.height,
              //       // color: Colors.blue[100*index],
              //       color: Colors.transparent,
              //       child: Text(context.watch<PageProvider>().currentIndex.toString()),
              //       // child: Text('sdfsdfsd'),
              //     );
              //   }
              // ),
              ListView.builder(
                controller: scrollController,
                itemCount: screens.length,
                itemBuilder:(context, index){
                  return screens[index];
                }
              ),

              // ListView(
              //   children: <Widget>[
              //     const IntroduceScreen(),
              //     const ExperienceScreen(),

              //       Container(
              //         width: constraints.biggest.width,
              //         height: constraints.biggest.height,
              //         // color: Colors.blue[200],
              //         color: Colors.transparent,
              //         child: Text(context.watch<PageProvider>().currentIndex.toString()),
              //         // child: Text('sdfsdfsd'),
              //       ),
              //       Container(
              //         width: constraints.biggest.width,
              //         height: constraints.biggest.height,
              //         color: Colors.blue[300],
              //         child: Text(context.watch<PageProvider>().currentIndex.toString()),
              //         // child: Text('sdfsdfsd'),
              //       ),
              //   ],
              // ),


              // SingleChildScrollView(
              //   controller: scrollController,
              //   child: Column(
              //     children: List.generate(4, (index){
              //       if(index ==0){
              //         return const IntroduceScreen();
              //       }
              //       return Container(
              //         width: constraints.biggest.width,
              //         height: constraints.biggest.height,
              //         color: Colors.transparent,
              //         child: Text(context.watch<PageProvider>().currentIndex.toString()),
              //         // child: Text('sdfsdfsd'),
              //       );
              //     }),
              //   ),
              // ),

              // SingleChildScrollView(
              //   controller: scrollController,
              //   child: Column(
              //     children: [
              //       const IntroduceScreen(),
              //       Container(
              //         width: constraints.biggest.width,
              //         height: constraints.biggest.height,
              //         color: Colors.blue[100],
              //         child: Text(context.watch<PageProvider>().currentIndex.toString()),
              //         // child: Text('sdfsdfsd'),
              //       ),
              //       const ExperienceScreen(),
              //       Container(
              //         width: constraints.biggest.width,
              //         height: constraints.biggest.height,
              //         // color: Colors.blue[200],
              //         color: Colors.transparent,
              //         child: Text(context.watch<PageProvider>().currentIndex.toString()),
              //         // child: Text('sdfsdfsd'),
              //       ),
              //     ],
              //   ),
              // ),

             

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
