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
              child: ListTile(
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit))),
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  GPAscoreDATA.listCalName.removeAt(index);
                                  GPAscoreDATA.listCalGrade.removeAt(index);
                                  GPAscoreDATA.listCalUnit.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete))),
                    ],
                  ),
                ),
                title: GPAapp.setText(
                    '${GPAscoreDATA.listCalName[index]} : ${GPAscoreDATA.listCalGrade[index]} : ${GPAscoreDATA.listCalUnit[index]}'),
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
      onPressed: () {},
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
