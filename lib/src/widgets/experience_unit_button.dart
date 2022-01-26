
import 'package:flutter/material.dart';
import 'package:who_is_shawn/src/data/dtos/experience_dto.dart';
import 'package:who_is_shawn/src/screens/experience_screen.dart';
import 'package:who_is_shawn/src/widgets/custom_painters/pop_up_circle_along_line.dart';
import 'package:who_is_shawn/src/widgets/experience_content_widget.dart';

class ExperienceUnitButton extends StatefulWidget {
  final HeadingDirection direction;
  final ExperienceDto experienceDto;

  const ExperienceUnitButton({ 
    Key? key, 
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.experienceDto.type == ExperienceType.personal
                  ? Colors.red
                  : Colors.blue
              ),
              width: 30, 
              height: 30,
            ),
          ),
          
          Visibility(
            visible: onHover,
            child: Positioned(
              top: widget.direction == HeadingDirection.bottomToTop
                ? 40
                : -45,
              child: Text(
                widget.experienceDto.project,
                style: const TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontWeight: FontWeight.bold,
                  fontSize: 30
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
                child: ExperienceContentWidget(
                  title: widget.experienceDto.title,
                  period: widget.experienceDto.period,
                  content: widget.experienceDto.content,
                ),
              ),
            ),
          ), 
        ],
      ),
    );
  }
}