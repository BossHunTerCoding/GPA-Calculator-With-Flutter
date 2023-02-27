import 'package:flutter/material.dart';
import 'package:gpa_calculator/main.dart';

class GPAscorePage extends StatefulWidget {
  const GPAscorePage({super.key,});

  @override
  State<GPAscorePage> createState() => _GPAscorePageState();
}

class _GPAscorePageState extends State<GPAscorePage> {
  AppBar setAppbar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      toolbarHeight: GPAapp.defaultHeightAppbar,
      backgroundColor: GPAapp.defaultColorsPages,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child:
              GPAapp.setText('GPA Summary'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
              },
              icon: const Icon(
                Icons.restore_from_trash,
                color: Colors.red,
                size: 35,
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppbar(),
    );
  }
}

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
