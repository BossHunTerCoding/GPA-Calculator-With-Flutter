import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calculator/main.dart';
import 'package:gpa_calculator/page/gpa_score_page.dart';

class GPAcalPage extends StatefulWidget {
  const GPAcalPage({
    super.key,
  });

  @override
  State<GPAcalPage> createState() => _GPAcalPageState();
}

class _GPAcalPageState extends State<GPAcalPage> {
  String textUpdate = '';
  String? selectUnit;
  String? selectGrade;

  //AppBar
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
          child: GPAapp.setText('List GPA : ${GPAapp.listCalName.length}'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              alertClearAll();
            },
            icon: const Icon(
              Icons.restore_from_trash,
              color: Colors.red,
              size: 35,
            ),
          ),
        )
      ],
    );
  }

  //Body
  Widget setBody() {
    return ListView.builder(
        itemCount: GPAapp.listCalName.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: const Color.fromARGB(255, 190, 18, 6),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    ListTile(
                      title: GPAapp.setText(
                          'Course : ${GPAapp.listCalName[index]}\nGrade : ${GPAapp.listCalGrade[index]}\nUnit : ${GPAapp.listCalUnit[index]}',
                          27),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              alertupdateCouse(context, index);
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                GPAapp.listCalName.removeAt(index);
                                GPAapp.listCalGrade.removeAt(index);
                                GPAapp.listCalUnit.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
        Icons.check_outlined,
        color: Colors.red,
      ),
      onPressed: () {
        if (GPAapp.listCalName.isEmpty) {
          showDialog(
              context: context,
              builder: (builderUI) {
                return CupertinoAlertDialog(
                    content: GPAapp.setText('Not Have GPA Calculate', 20));
              });
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GPAscorePage()),
          );
        }
      },
    );
  }

  //sub method
  void alertClearAll() {
    var buttonConfirm = Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 90,
        child: FloatingActionButton(
          hoverColor: const Color.fromARGB(255, 163, 15, 5),
          backgroundColor: Colors.red,
          onPressed: () {
            setState(() {
              GPAapp.listCalName.clear();
              GPAapp.listCalGrade.clear();
              GPAapp.listCalUnit.clear();
              Navigator.pop(context);
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: GPAapp.setText('Confirm', 20),
        ),
      ),
    );

    var buttonCancel = Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 90,
        child: FloatingActionButton(
          hoverColor: const Color.fromARGB(255, 163, 15, 5),
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.pop(context);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: GPAapp.setText('Cancel', 20),
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 1,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: GPAapp.setText(
                          'Are your sure you want to clear all', 25)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonConfirm,
                    buttonCancel,
                  ],
                )
              ],
            ),
          );
        });
  }

  void alertupdateCouse(BuildContext context, int index) {
    var courseName = Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: 375,
        child: TextField(
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          onChanged: (value) {
            setState(() {
              textUpdate = value;
            });
          },
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.book_sharp,
              color: Colors.amber,
            ),
            labelText: 'Course Name',
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

    var courseGrade = Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: 375,
        child: DropdownButtonFormField(
            itemHeight: 100,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            menuMaxHeight: 500,
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
            value: selectGrade,
            items: GPAapp.listGrades
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

    var courseUnit = Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: 375,
        child: DropdownButtonFormField(
            itemHeight: 100,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            menuMaxHeight: 500,
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

    var buttonUpdate = Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: 90,
        child: FloatingActionButton(
          hoverColor: const Color.fromARGB(255, 163, 15, 5),
          backgroundColor: Colors.red,
          onPressed: () {
            textUpdate == '' ? textUpdate = GPAapp.listCalName[index] : null;
            selectGrade == null
                ? selectGrade = GPAapp.listCalGrade[index]
                : selectGrade = selectGrade;
            selectUnit == null
                ? selectUnit = GPAapp.listCalUnit[index]
                : selectUnit = selectUnit;
            setState(() {
              GPAapp.listCalName[index] = textUpdate;
              GPAapp.listCalGrade[index] = selectGrade!;
              GPAapp.listCalUnit[index] = selectUnit!;
              textUpdate = '';
              selectGrade = null;
              selectUnit = null;
              Navigator.pop(context);
            });
          },
          shape: const BeveledRectangleBorder(),
          child: GPAapp.setText('Update', 20),
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            elevation: 0,
            backgroundColor: GPAapp.defaultColorsPages,
            children: [
              courseName,
              courseGrade,
              courseUnit,
              buttonUpdate,
            ],
          );
        });
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
