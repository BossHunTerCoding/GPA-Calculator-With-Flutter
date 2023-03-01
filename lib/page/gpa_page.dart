import 'package:flutter/material.dart';
import 'package:gpa_calculator/main.dart';
import 'package:gpa_calculator/page/gpa_cal_page.dart';

class GPAPage extends StatefulWidget {
  const GPAPage({super.key});

  @override
  State<GPAPage> createState() => _GPAPageState();
}

class _GPAPageState extends State<GPAPage> {
  final TextEditingController textCouseName = TextEditingController();
  late FocusNode selectFocus;
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
              ).then((value) {
                setState(() {});
              });
            },
            elevation: 2.0,
            fillColor: Colors.red,
            shape: const CircleBorder(),
            child: GPAapp.setText('${GPAapp.listCalName.length}'),
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
      child: Image.asset(
        'assets/GPAICON.png',
        height: 200,
        width: 200,
      ),
    );

    //Course Name
    var courseName = Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SizedBox(
        width: 350,
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
        width: 350,
        child: DropdownButtonFormField(
            itemHeight: 100,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            menuMaxHeight: 500,
            dropdownColor: GPAapp.defaultColorsPages,
            decoration: const InputDecoration(
              labelText: 'Select Your Course Unit (required)',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
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
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            value: selectUnit,
            items: GPAapp.listUnits
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
        width: 350,
        child: DropdownButtonFormField(
            itemHeight: 100,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            menuMaxHeight: 500,
            dropdownColor: GPAapp.defaultColorsPages,
            decoration: const InputDecoration(
              labelText: 'Select Your Course Grade (required)',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
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
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            value: selectGrade,
            items: GPAapp.listGrades
                .map((items) => DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                      ),
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
      child: Center(
        child: Column(
          children: [
            logoBanner,
            courseName,
            courseGrade,
            courseUnit,
          ],
        ),
      ),
    );
  }

  //Bottom
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 1,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        columeAlertNull('Value Grade', ' Value Unit'),
                        columeAlertNull(':', ':'),
                        columeAlertNull('$selectGrade', '$selectUnit'),
                      ],
                    ));
              });
        } else {
          textCouseName.text == ''
              ? textCouseName.text = 'Couse Name ${countPressed += 1}'
              : null;
          setState(() {
            GPAapp(
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
  void initState() {
    super.initState();
    selectFocus = FocusNode();
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
