import 'package:flutter/material.dart';
import 'package:gpa_calculator/main.dart';
import 'package:gpa_calculator/page/gpa_cal_page.dart';
import 'package:gpa_calculator/page/gpa_score_page.dart';

class GPAPage extends StatefulWidget {
  const GPAPage({super.key});

  @override
  State<GPAPage> createState() => _GPAPageState();
}

class _GPAPageState extends State<GPAPage> {
  late BuildContext builderUI;
  late FocusNode selectFocus;
  final TextEditingController textCouseName = TextEditingController();
  String? selectUnit;
  String? selectGrade;

  int countPressed = 0;

  //AppBar
  AppBar setAppbar() {
    return AppBar(
      toolbarHeight: GPAapp.defaultHeightAppbar,
      backgroundColor: GPAapp.defaultColorsPages,
      title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: GPAapp.setText(GPAapp.textTitle),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GPAcalPage()),
              );
            },
            elevation: 2.0,
            fillColor: Colors.red,
            shape: const CircleBorder(),
            child: GPAapp.setText('${GPAscoreDATA.listCalName.length}'),
          ),
        )
      ],
    );
  }

  //Body
  Widget setBody() {
    //Banner
    var logoBanner = Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.asset(
          'assets/GPAICON.png',
          scale: 0.25,
        ),
      ),
    );

    //Course Name
    var courseName = Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SizedBox(
        width: 375,
        child: TextField(
          controller: textCouseName,
          focusNode: selectFocus,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.book_sharp,
              color: Colors.amber,
            ),
            labelText: 'Couse Name',
            labelStyle: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            hintText: 'What is your couse name? (optional)',
            hintStyle: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(82, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    //Course Unit
    var courseUnit = Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SizedBox(
        width: 375,
        child: DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Select Your Course Unit (required)',
              prefixIcon: Icon(
                Icons.format_underline_outlined,
                color: Colors.amber,
              ),
              border: OutlineInputBorder(),
            ),
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.red,
            ),
            value: selectUnit,
            items: GPAscoreDATA.listUnits
                .map((String items) => DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    ))
                .toList(),
            onChanged: (newValue) {
              setState(() {
                selectUnit = newValue;
              });
            }),
      ),
    );

    //Course Grade
    var courseGrade = Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SizedBox(
        width: 375,
        child: DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: 'Select Your Course Grade (required)',
              prefixIcon: Icon(
                Icons.grade,
                color: Colors.amber,
              ),
              border: OutlineInputBorder(),
            ),
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.red,
            ),
            value: selectGrade,
            items: GPAscoreDATA.listGrades
                .map((items) => DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    ))
                .toList(),
            onChanged: (newValue) {
              setState(() {
                selectGrade = newValue;
              });
            }),
      ),
    );

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          logoBanner,
          courseName,
          courseGrade,
          courseUnit,
        ],
      ),
    );
  }

  //Botton
  Widget setBottomNavBar() {
    return BottomAppBar(
      color: Colors.red,
      child: Container(
        height: 75,
      ),
    );
  }

  Widget setFloatingButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.add,
        color: Colors.red,
      ),
      onPressed: () {
        if (selectGrade == null || selectUnit == null) {
          showDialog(
              context: context,
              builder: (builderUI) {
                return AlertDialog(
                    content: GPAapp.setText(
                        'Value Grade : $selectGrade (required) \nValue Unit : $selectUnit (required)',
                        20));
              });
        } else {
          textCouseName.text == ''
              ? textCouseName.text = 'Couse Name ${countPressed += 1}'
              : null;
          setState(() {
            GPAscoreDATA(
              textCouseName.text,
              selectGrade!,
              selectUnit!,
            );
            textCouseName.clear();
            selectGrade = null;
            selectUnit = null;
            selectFocus.requestFocus();
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    selectFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    builderUI = context;
    return Scaffold(
      appBar: setAppbar(),
      body: setBody(),
      bottomNavigationBar: setBottomNavBar(),
      floatingActionButton: setFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
