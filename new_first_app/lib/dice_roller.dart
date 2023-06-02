import 'package:flutter/material.dart';
import "package:new_first_app/styled_text.dart";
import 'dart:math';

final randomizer=Random(); //for optimization of memory
class DiceRoller extends StatefulWidget{
 const DiceRoller({super.key});
  @override
  State<DiceRoller> createState(){
    return _DiceRoller();
  }
}

class _DiceRoller extends State<DiceRoller>{
  //var activeDiceImage='assets/images/dice-2.png';
  var currentdiceRoll=2;
  void rollDice() {
    //var diceroll=randomizer.nextInt(6)+1;
    setState(() {
      //activeDiceImage='assets/images/dice-$diceroll.png';
      currentdiceRoll=randomizer.nextInt(6)+1;
    });
  }
  @override
  Widget build(context){
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/dice-$currentdiceRoll.png',
            //activeDiceImage,
            width: 200,
          ),
          TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                  foregroundColor:const Color.fromARGB(255, 13, 16, 19),
                  textStyle: const TextStyle(fontSize: 30)),
              child: const StyledText('Roll the Dice'))
        ],
      );
  }
}