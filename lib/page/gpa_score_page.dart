import 'package:flutter/material.dart';
import 'package:gpa_calculator/main.dart';

class GPAscorePage extends StatefulWidget {
  const GPAscorePage({
    super.key,
  });

  @override
  State<GPAscorePage> createState() => _GPAscorePageState();
}

class _GPAscorePageState extends State<GPAscorePage> {
  AppBar setAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: GPAapp.defaultHeightAppbar,
      backgroundColor: GPAapp.defaultColorsPages,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: GPAapp.setText('GPA Summary'),
        ),
      ),
    );
  }

  Widget setBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
          child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: GPAapp.setText('Confirm'))
            ],
          ),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppbar(),
      body: setBody(),
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
    '0.5',
    '1',
    '1.5',
    '2',
    '2.5',
    '3',
    '3.5',
    '4',
    '4.5',
    '5',
    '5.5',
    '6',
    '6.5',
    '7',
    '7.5',
    '8',
    '8.5',
    '9',
    '9.5',
    '10',
    '10.5',
    '11',
    '11.5',
    '12',
    '12.5',
    '13',
    '13.5',
    '14',
    '14.5',
    '15',
  ];
  static List<String> listGrades = ['A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'F'];

  static List<String> listCalName = [];
  static List<String> listCalGrade = [];
  static List<String> listCalUnit = [];

  static double sumUnit(var list) {
    double sumUnit = 0;
    for (int index = 0; index <= list.length; index++) {
      sumUnit += double.parse(list[index]);
    }
    return sumUnit;
  }

  static double sumGrade(List<String> listGrades, List<String> listUnits) {
    double sumGrade = 0;
    for (int index = 0; index <= listGrades.length; index++) {
      var courseUnit = double.parse(listUnits[index]);
      switch (listGrades[index]) {
        case 'A':
          {
            sumGrade += 4 * courseUnit;
          }
          break;
        case 'B+':
          {
            sumGrade += 3.5 * courseUnit;
          }
          break;
        case 'B':
          {
            sumGrade += 3 * courseUnit;
          }
          break;
        case 'C+':
          {
            sumGrade += 2.5 * courseUnit;
          }
          break;
        case 'C':
          {
            sumGrade += 2 * courseUnit;
          }
          break;
        case 'D+':
          {
            sumGrade += 1.5 * courseUnit;
          }
          break;
        case 'D':
          {
            sumGrade += 1 * courseUnit;
          }
          break;
        case 'F':
          {
            sumGrade += 0 * courseUnit;
          }
          break;
      }
    }
    return sumGrade;
  }

  static double sumGPA(double sumGrade, double sumUnit) {
    double sumGPA = sumGrade / sumUnit;
    return double.parse(sumGPA.toStringAsFixed(2));
  }
}
