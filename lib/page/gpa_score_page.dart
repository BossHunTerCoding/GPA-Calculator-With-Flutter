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
  double sumGrade = GPAapp.sumGrade(GPAapp.listCalGrade, GPAapp.listCalUnit);
  double sumUnit = GPAapp.sumUnit(GPAapp.listCalUnit);

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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: SizedBox(
              width: 350,
              height: 525,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  columeOutput(title: 'Grade Summary', output: sumGrade),
                  columeOutput(title: 'Unit Summary', output: sumUnit),
                  columeOutput(
                      title: 'GPA',
                      output: GPAapp.sumGPA(sumGrade, sumUnit),
                      summary: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Bottom
  Widget setBottomNavBar() {
    return BottomAppBar(
      color: GPAapp.defaultColorsPages,
      child: Container(
        height: 75,
      ),
    );
  }

  Widget setFloatingButton() {
    return SizedBox(
      width: 200,
      child: FloatingActionButton(
        hoverColor: const Color.fromARGB(255, 163, 15, 5),
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            Navigator.pop(context);
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: GPAapp.setText('Confirm'),
        ),
      ),
    );
  }

  Widget columeOutput({
    required String title,
    required var output,
    bool? summary,
  }) {
    var outputWidget = summary == true
        ? SizedBox(
            width: 300,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GPAapp.setText(title, 50),
                      GPAapp.setText(' : ', 50),
                      GPAapp.setText('$output', 50),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: GPAapp.setText(GPAapp.checkGradeHonor(output))),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  children: [
                    GPAapp.setText(title, 16),
                    GPAapp.setText(' : ', 16),
                    GPAapp.setText('$output', 16),
                  ],
                ),
              ),
            ),
          );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.red,
        child: outputWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppbar(),
      body: setBody(),
      bottomNavigationBar: setBottomNavBar(),
      floatingActionButton: setFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
