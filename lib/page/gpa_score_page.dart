/*import 'package:flutter/material.dart';

class GPAscorePage extends StatelessWidget {
  const GPAscorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}*/

class GPAscoreDATA {
  GPAscoreDATA(String courseName, String courseGrade, String courseUnit) {
    listCalName.add(courseName);
    listCalGrade.add(courseGrade);
    listCalUnit.add(courseUnit);
  }

  static List<String> listUnits = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  static List<String> listGrades = ['A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];

  static List<String> listCalName = [];
  static List<String> listCalGrade = [];
  static List<String> listCalUnit = [];
}
