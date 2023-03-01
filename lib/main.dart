import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gpa_calculator/page/gpa_page.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
      runApp(const GPArunApp()),
    };

class GPArunApp extends StatefulWidget {
  const GPArunApp({super.key});

  @override
  State<GPArunApp> createState() => _GPArunAppState();
}

class _GPArunAppState extends State<GPArunApp> {
  //theme
  ThemeData setThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: GPAapp.defaultColorsPages,
      colorSchemeSeed: GPAapp.defaultColorsPages,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPA Calculator',
      theme: setThemeData(),
      darkTheme: ThemeData.dark(),
      home: const GPAPage(),
    );
  }
}

class GPAapp {
  GPAapp(String courseName, String courseGrade, String courseUnit) {
    listCalName.add(courseName);
    listCalGrade.add(courseGrade);
    listCalUnit.add(courseUnit);
  }
  //value theme app
  static var textTitle = 'GPA Calculator';
  static var textColor = Colors.white;
  static var defaultHeightAppbar = 120.0;
  static var defaultColorsPages = const Color.fromARGB(255, 56, 56, 56);

  static Text setText(
      [String text = 'Text Default',
      double fontSize = 30.0,
      Color color = Colors.white,
      FontWeight fontWeight = FontWeight.bold]) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }

  //value & behavior app
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
  static List<String> listCalUnit = [];
  static List<String> listCalGrade = [];

  static double sumGPA(double sumGrade, double sumUnit) {
    double sumGPA = sumGrade / sumUnit;
    return double.parse(sumGPA.toStringAsFixed(2));
  }

  static double sumUnit(var list) {
    double sumUnit = 0;
    for (int index = 0; index < list.length; index++) {
      sumUnit += double.parse(list[index]);
    }
    return sumUnit;
  }

  static double sumGrade(List<String> listGrades, List<String> listUnits) {
    double sumGrade = 0;
    for (int index = 0; index < listGrades.length; index++) {
      switch (listGrades[index]) {
        case 'A':
          {
            sumGrade += 4 * double.parse(listUnits[index]);
          }
          break;
        case 'B+':
          {
            sumGrade += 3.5 * double.parse(listUnits[index]);
          }
          break;
        case 'B':
          {
            sumGrade += 3 * double.parse(listUnits[index]);
          }
          break;
        case 'C+':
          {
            sumGrade += 2.5 * double.parse(listUnits[index]);
          }
          break;
        case 'C':
          {
            sumGrade += 2 * double.parse(listUnits[index]);
          }
          break;
        case 'D+':
          {
            sumGrade += 1.5 * double.parse(listUnits[index]);
          }
          break;
        case 'D':
          {
            sumGrade += 1 * double.parse(listUnits[index]);
          }
          break;
        case 'F':
          {
            sumGrade += 0 * double.parse(listUnits[index]);
          }
          break;
      }
    }
    return sumGrade;
  }

  static String checkGradeHonor(double gpa) {
    if (gpa >= 3.75) {
      return 'First Class Honors Degree or gold coins';
    } else if (gpa >= 3.5) {
      return 'First Class Honors Degree';
    } else if (gpa >= 3.25) {
      return 'Bachelor\'s degree in the second class';
    } else {
      return 'Well done.';
    }
  }
}
