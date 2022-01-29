

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_is_shawn/src/design_foundation/app_colors.dart';
import 'package:who_is_shawn/src/widgets/circle_and_text.dart';
import 'package:who_is_shawn/src/providers/experience_provider.dart';
import 'package:who_is_shawn/src/widgets/custom_painters/pop_up_circle_along_line.dart';
import 'package:who_is_shawn/src/widgets/decorations/experience_screen_background_decoration.dart';
import 'package:who_is_shawn/src/widgets/experience_unit_button.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({ Key? key }) : super(key: key);

  @override
  _ExperienceScreenState createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ExperienceProvider>(context, listen: false).fetchData();  
  }
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width,
      height: size.height,
      // color: AppColors.yellowMintCream,
      decoration: ExperienceScreenBackgroundDecoration(),
      child: Stack(
        // clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: List.generate(
          context.watch<ExperienceProvider>().list.length, 
          (index){
            return Positioned(
              left: size.width * (index+1)/(context.watch<ExperienceProvider>().list.length+1),
              child: ExperienceUnitButton(
                direction: index.isOdd
                  ? HeadingDirection.topToBottom
                  : HeadingDirection.bottomToTop,
                experienceDto: context.watch<ExperienceProvider>().list[index],
              ),
            );
          }
        )..add(
          Positioned(
            top: 200,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAndText(
                  circleColor: AppColors.pastelBlue,
                  text: 'Personal',
                ),
                const SizedBox(height: 10,),
                CircleAndText(
                  circleColor: AppColors.pastelRed,
                  text: 'Work',
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}




