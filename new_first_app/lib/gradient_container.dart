import 'package:flutter/material.dart';
import "package:new_first_app/dice_roller.dart";

const upallign = Alignment.topLeft;
const downallign = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
 const GradientContainer(this.colors, {super.key});
  final List<Color> colors;

  const GradientContainer.purple({super.key})
      : colors = const [
          Color.fromARGB(255, 24, 22, 27),
          Color.fromARGB(31, 15, 4, 37),
          Color.fromARGB(221, 101, 37, 37),
        ];
  
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: upallign,
          end: downallign,
        ),
      ),
      child:const Center(
          child: DiceRoller()
           ),        //StyledText('My new App \n\t\t\tHurray!')   
    );
  }
}
