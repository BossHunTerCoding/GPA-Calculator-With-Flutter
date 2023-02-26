import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page/gpa_page.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
      runApp(const GPAapp())
    };

class GPAapp extends StatefulWidget {
  const GPAapp({super.key});

  static var textTitle = 'GPA Calculator';
  static var textColor = Colors.white;
  static var defaultHeightAppbar = 120.0;
  static var defaultColorsPages = const Color.fromARGB(255, 56, 56, 56);

  static Text setText(
          [String text = 'Text Default',
          double fontSize = 30.0,
          Color color = Colors.white,
          FontWeight fontWeight = FontWeight.bold]) =>
      Text(
        text,
        style:
            TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
      );

  @override
  State<GPAapp> createState() => _GPAappState();
}

class _GPAappState extends State<GPAapp> {
  ThemeData setThemeData() => ThemeData(
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
