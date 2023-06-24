import "package:flutter/material.dart";
import 'package:expenses_tracker_app/widgets/expences.dart';

var kcolorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181)
  );
var kdarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125)
  );
void main(){
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kdarkScheme,
        cardTheme: const CardTheme().copyWith(
          color: kdarkScheme.secondaryContainer,
          margin:const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kdarkScheme.primaryContainer,
            foregroundColor: kdarkScheme.onPrimaryContainer,
          )
        ),
        // textTheme: ThemeData().textTheme.copyWith(
        //   titleLarge:const TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 16,
        //   )
        // ),
        dropdownMenuTheme:const DropdownMenuThemeData().copyWith(
           inputDecorationTheme: InputDecorationTheme(
            fillColor: kdarkScheme.primaryContainer,
           )
        )
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kcolorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorScheme.onPrimaryContainer,
          foregroundColor: kcolorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kcolorScheme.secondaryContainer,
          margin:const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer,
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kcolorScheme.onSecondaryContainer,
            fontSize: 16,
          )
        ),
        dropdownMenuTheme:const DropdownMenuThemeData().copyWith(
           inputDecorationTheme: InputDecorationTheme(
            fillColor: kcolorScheme.primaryContainer,
           )
        )
        ),
        themeMode: ThemeMode.system,
      home:const Expenses(),
      ),
  );
}