

import 'package:flutter/material.dart';
import 'package:who_is_shawn/src/data/dtos/experience_dto.dart';
import 'package:who_is_shawn/src/design_foundation/app_colors.dart';
import 'package:who_is_shawn/src/widgets/circle_and_text.dart';
import 'package:who_is_shawn/src/widgets/custom_painters/pop_up_circle_along_line.dart';
import 'package:who_is_shawn/src/widgets/experience_unit_button.dart';


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

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Positioned(
                top: -size.height/2 + 200,
                right: 30,
                child: Column(
                  children: const <Widget>[
                    CircleAndText(
                      circleColor: Colors.green,
                      text: 'sdfsdfsd',
                    ),
                    SizedBox(height: 10,),
                    CircleAndText(
                      circleColor: Colors.green,
                      text: 'sdfsdfsd',
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: 10,
                color: AppColors.darkWinterGreen,
              ),
              Positioned(
                left: size.width*0.15,
                child: ExperienceUnitButton(
                  title: 'Blindness',
                  direction: HeadingDirection.bottomToTop,
                  experienceDto: ExperienceDto(
                    title: 'dsfdf',
                    period: 'dfs',
                    content: 'sdfsdf'
                  ),
                ),
              ),
              Positioned(
                left: size.width*0.30,
                child: ExperienceUnitButton(
                  title: 'Blindness',
                  direction: HeadingDirection.topToBottom,
                  experienceDto: ExperienceDto(
                    title: 'dsfdf',
                    period: 'dfs',
                    content: 'sdfsdf'
                  ),
                ),
              ),
              Positioned(
                left: size.width*0.60,
                child: ExperienceUnitButton(
                  title: 'Blindness',
                  direction: HeadingDirection.bottomToTop,
                  experienceDto: ExperienceDto(
                    title: 'dsfdf',
                    period: 'dfs',
                    content: 'sdfsdf'
                  ),
                ),
              ),
              Positioned(
                left: size.width*0.80,
                child: ExperienceUnitButton(
                  title: 'Blindness',
                  direction: HeadingDirection.topToBottom,
                  experienceDto: ExperienceDto(
                    title: 'dsfdf',
                    period: 'dfs',
                    content: 'sdfsdf'
                  ),
                ),
              ),

            ],
          )

        ],
      ),

    );
  }
}





