

import 'package:flutter/material.dart';
import 'package:who_is_shawn/design_foundation/app_colors.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({ Key? key }) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: AppColors.yellowMintCream,
      // decoration: IntroduceScreenBackgroundDecoration2(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   width: size.width,
          //   height: 10,
          //   color: AppColors.darkWinterGreen,
          //   child: Row(
          //     children: [
                // Container(
                //   width: 100,height: 100,color: Colors.red,
                // )
          //     ],
          //   ),
          // ),
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                width: size.width,
                height: 10,
                color: AppColors.darkWinterGreen,
              ),
              Positioned(
                left: size.width*0.1,
                child: ExperienceUnitButton(),
              ),


            ],
          )

        ],
      ),

    );
  }
}
class ExperienceUnitButton extends StatefulWidget {
  const ExperienceUnitButton({ Key? key }) : super(key: key);

  @override
  _ExperienceUnitButtonState createState() => _ExperienceUnitButtonState();
}

class _ExperienceUnitButtonState extends State<ExperienceUnitButton> with TickerProviderStateMixin{
  bool onHover = false;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1000)
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('fsdfs');
        controller.forward();
      },
      onHover: (onHover){
        print(onHover);
        setState(() {
          this.onHover= onHover;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [

          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceIn,
            top: animation.value * -50,
            // top: 40,
            child: Container(width: 40,height: 40, color: Colors.black,)
          ),

          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            width: 30, 
            height: 30,
          ),
          Visibility(
            visible: onHover,
            child: const Positioned(
              top: 30,
              child: Text(
                'dfssdfsdfsdfsd'
              )
            ),
          ),
          
        ],
      ),
    );
  }
}







class IntroduceScreenBackgroundDecoration2 extends Decoration{

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _IntroduceScreenBackgroundDecorationBoxPainter();
  }
  
}

class _IntroduceScreenBackgroundDecorationBoxPainter extends BoxPainter{
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {


    // Paint paint2 = Paint();
    // paint2.color = Colors.black;
    // paint2.strokeWidth=5;
    // Rect rect2 = Rect.fromPoints(Offset(0,0), Offset(configuration.size!.width, configuration.size!.height));
    // canvas.drawRect(rect2, paint2);


  
    Paint paint = Paint();
    paint.color = AppColors.cambridgeBlue;
    // Rect rect = Rect.fromCircle(center: offset, radius: 100);
    offset = Offset(configuration.size!.width/2, configuration.size!.height/2);
    Rect rect = Rect.fromCenter(center: offset, width: configuration.size!.width/2, height: configuration.size!.height);
    // Rect rect = Rect.fromCenter(center: offset, width: configuration.size!.width/2, height: 200);   
    canvas.drawRect(rect, paint);

   
  }

}