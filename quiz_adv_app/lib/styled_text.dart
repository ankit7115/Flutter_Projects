import "package:flutter/material.dart";

class StyledText extends StatelessWidget{
  const StyledText(this.text,{super.key});
  final String text;
  @override
  Widget build(context){
    return Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 254, 254, 255),
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 0.004,
                    color: Color.fromARGB(255, 14, 15, 16),
                  ),
                ],
              ),
            );
  }
}