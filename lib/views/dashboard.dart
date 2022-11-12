import 'package:medicare/widgets/customButton.dart';
import 'package:medicare/widgets/customTextbox.dart';
import 'package:medicare/widgets/searchBar.dart';

import '../../widgets/dialog/loadingDialog.dart';
import '../../styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../utils/helper.dart';
import 'addSymptoms.dart';

@override
void initState() {}

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Image.asset(
                    "assets/images/CheckenLogo.png",
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddSymptoms(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 80,
                          alignment: Alignment.center,
                          child: const Text(
                            "Predict with\n Symptoms",
                            style: SubHeadStyle,
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Button2BorderColor),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: DefaultColor.withOpacity(0.4),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 80,
                        alignment: Alignment.center,
                        child: const Text(
                          "Predict with\n Image",
                          style: SubHeadStyle,
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Button2BorderColor),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: DefaultColor.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
