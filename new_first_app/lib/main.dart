import 'package:flutter/material.dart';
import 'package:new_first_app/gradient_container.dart';

void main() {
  runApp(const MyApp());  
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(context){
    return const MaterialApp(
      home:  Scaffold(
        body:  GradientContainer.purple()
      ),
    );
  }
}