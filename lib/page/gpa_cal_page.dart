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
              GPAapp.setText('List GPA : ${GPAscoreDATA.listCalName.length}'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return AlertDialog(
                        elevation: 1,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GPAapp.setText(
                                  'Are your sure you want to clear all', 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 90,
                                    child: FloatingActionButton(
                                      hoverColor:
                                          const Color.fromARGB(255, 163, 15, 5),
                                      backgroundColor: Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          GPAscoreDATA.listCalName.clear();
                                          GPAscoreDATA.listCalGrade.clear();
                                          GPAscoreDATA.listCalUnit.clear();
                                          Navigator.pop(context);
                                        });
                                      },
                                      shape: const BeveledRectangleBorder(),
                                      child: GPAapp.setText('Confirm', 20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 90,
                                    child: FloatingActionButton(
                                      hoverColor:
                                          const Color.fromARGB(255, 163, 15, 5),
                                      backgroundColor: Colors.red,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      shape: const BeveledRectangleBorder(),
                                      child: GPAapp.setText('Cancel', 20),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    });
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

  Widget setBody() {
    return ListView.builder(
        itemCount: GPAscoreDATA.listCalName.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  ListTile(
                    title: GPAapp.setText(
                        'Course : ${GPAscoreDATA.listCalName[index]}\nGrade : ${GPAscoreDATA.listCalGrade[index]}\nUnit : ${GPAscoreDATA.listCalUnit[index]}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      elevation: 0,
                                      backgroundColor:
                                          GPAapp.defaultColorsPages,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SizedBox(
                                            width: 375,
                                            child: TextField(
                                              onChanged: (value) {
                                                setState(() {
                                                  textUpdate = value;
                                                });
                                              },
                                              style: const TextStyle(
                                                  color: Colors.white),
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
                                                hintText:
                                                    'What is your couse name? (optional)',
                                                hintStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      82, 255, 255, 255),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SizedBox(
                                            width: 375,
                                            child: DropdownButtonFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText:
                                                      'Select Your Course Grade (required)',
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
                                                items: GPAscoreDATA.listGrades
                                                    .map((items) =>
                                                        DropdownMenuItem(
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SizedBox(
                                            width: 375,
                                            child: DropdownButtonFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  labelText:
                                                      'Select Your Course Unit (required)',
                                                  labelStyle: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons
                                                        .format_underline_outlined,
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
                                                    .map((String items) =>
                                                        DropdownMenuItem(
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
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: SizedBox(
                                            width: 90,
                                            child: FloatingActionButton(
                                              hoverColor: const Color.fromARGB(
                                                  255, 163, 15, 5),
                                              backgroundColor: Colors.red,
                                              onPressed: () {
                                                if (selectGrade == null ||
                                                    selectUnit == null) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (builderUI) {
                                                        return AlertDialog(
                                                            elevation: 1,
                                                            content: GPAapp.setText(
                                                                'Value Grade : $selectGrade (required) \nValue Unit : $selectUnit (required)',
                                                                20));
                                                      });
                                                } else {
                                                  textUpdate == ''
                                                      ? textUpdate =
                                                          GPAscoreDATA
                                                                  .listCalName[
                                                              index]
                                                      : null;
                                                  setState(() {
                                                    GPAscoreDATA.listCalName[
                                                        index] = textUpdate;
                                                    GPAscoreDATA.listCalGrade[
                                                        index] = selectGrade!;
                                                    GPAscoreDATA.listCalUnit[
                                                        index] = selectUnit!;
                                                    textUpdate = '';
                                                    selectGrade = null;
                                                    selectUnit = null;
                                                    Navigator.pop(context);
                                                  });
                                                }
                                              },
                                              shape:
                                                  const BeveledRectangleBorder(),
                                              child:
                                                  GPAapp.setText('Update', 20),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                GPAscoreDATA.listCalName.removeAt(index);
                                GPAscoreDATA.listCalGrade.removeAt(index);
                                GPAscoreDATA.listCalUnit.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

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
        if (GPAscoreDATA.listCalName.isEmpty) {
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
