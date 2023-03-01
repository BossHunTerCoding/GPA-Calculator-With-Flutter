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
  double sumGrade= GPAapp.sumGrade(GPAapp.listCalGrade, GPAapp.listCalUnit);
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
                  GPAapp.setText(
                    'Grade Summary : $sumGrade',
                  ),
                  GPAapp.setText(
                    'Unit Summary : $sumUnit',
                  ),
                  GPAapp.setText(
                    'GPA Summary : ${GPAapp.sumGPA(sumGrade,sumUnit)}',
                  ),
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

  Widget columeAlertNull(String text1, String text2,
      {Color color = Colors.white}) {
    var checkText1 = text1 == 'null' ? '(Required)' : text1;
    var checkText2 = text2 == 'null' ? '(Required)' : text2;
    var checkTextColor1 = text1 == 'null' ? Colors.red : color;
    var checkTextColor2 = text2 == 'null' ? Colors.red : color;

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: GPAapp.setText(checkText1, 20, checkTextColor1),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: GPAapp.setText(checkText2, 20, checkTextColor2),
          ),
        ],
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
