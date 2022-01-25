

import 'package:flutter/material.dart';
import 'package:who_is_shawn/design_foundation/app_colors.dart';
import 'package:who_is_shawn/widgets/custom_painters/pop_up_circle_along_line.dart';

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
                child: ExperienceUnitButton(
                  title: 'Blindness',
                ),
              ),


            ],
          )

        ],
      ),

    );
  }
}

class ExperienceUnitButton extends StatefulWidget {
  final String title;
  const ExperienceUnitButton({ Key? key, required this.title }) : super(key: key);

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
      duration: const Duration(milliseconds: 1000)
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // print('fsdfs');
        
        controller.status == AnimationStatus.dismissed
          ? controller.forward()
          : controller.reverse();
      },
      onHover: (onHover){
        // print(onHover);
        setState(() {
          this.onHover= onHover;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [

          
          CustomPaint(
            painter: PopUpCircleAlongLine(
              direction: HeadingDirection.bottomToTop, 
              animation: animation,
              strokeColor: Colors.black,
              circleColor: Colors.blue,
              radiusOfCircle: 12
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              width: 30, 
              height: 30,
            ),
          ),


          Visibility(
            visible: onHover,
            child: Positioned(
              top: 40,
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontWeight: FontWeight.bold,
                  fontSize: 36
                ),
              )
            ),
          ),
          
        ],
      ),
    );
  }
}




