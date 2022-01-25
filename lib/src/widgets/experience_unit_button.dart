
import 'package:flutter/material.dart';
import 'package:who_is_shawn/src/data/dtos/experience_dto.dart';
import 'package:who_is_shawn/src/screens/experience_screen.dart';
import 'package:who_is_shawn/src/widgets/custom_painters/pop_up_circle_along_line.dart';
import 'package:who_is_shawn/src/widgets/experience_content_widget.dart';

class ExperienceUnitButton extends StatefulWidget {
  final String title;
  final HeadingDirection direction;
  final ExperienceDto experienceDto;

  const ExperienceUnitButton({ 
    Key? key, 
    required this.title,
    required this.direction,
    required this.experienceDto
  }) : super(key: key);

  @override
  _ExperienceUnitButtonState createState() => _ExperienceUnitButtonState();
}

class _ExperienceUnitButtonState extends State<ExperienceUnitButton> with TickerProviderStateMixin{
  bool onHover = false;
  bool isTapped = false;
  bool isAnimationCompleted = false;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000)
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        isAnimationCompleted = true;
      } else{
        isAnimationCompleted = false;
      }
      setState(() {});
    });
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
        setState(() {
          isTapped = !isTapped;
        });
        
        controller.status == AnimationStatus.dismissed
          ? controller.forward()
          : controller.reverse();

        
      },
      onHover: (onHover){
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
              direction: widget.direction, 
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
          // AnimatedBuilder(
          //   animation: animation,
          //   child: Container(
          //     width: 100, height: 30, color: Colors.blue,
          //   ),
          //   builder: (context, child){

          //   }
          // ),
          
          Visibility(
            visible: onHover,
            child: Positioned(
              top: widget.direction == HeadingDirection.bottomToTop
                ? 40
                : -40,
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
          Visibility(
            visible: isAnimationCompleted,
            child: Positioned(
              top: widget.direction == HeadingDirection.bottomToTop
                ? -300
                : 150,  
              child: Container(
                width: 300,
                height: 180, 
                color: Colors.red,
                child: const ExperienceContentWidget(
                  title: '빌리지 피플 주식회사',
                  period: '(2021.02 – 2021.08)',
                  content: '- skill : Flutter/Dart, Bloc, fastlane\n- Flutter 2.0 migration 및 코드 가독성, 기능 개선\n- 딥링크 도입\n- 유저 SNS 페이지 디자인 개편\n- Google map과 Gps를 이용해 산책 트랙킹 기능',
                ),
              ),
            ),
          ), 
        ],
      ),
    );
  }
}