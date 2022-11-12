import 'package:medicare/main.dart';
import 'package:medicare/widgets/customButton.dart';
import 'package:medicare/api/api_calls.dart';
import '../../styles.dart';
import 'package:flutter/material.dart';
import '../utils/helper.dart';
import 'dashboard.dart';

@override
void initState() {}

class ShowPrediction extends StatefulWidget {
  String disease;
  String stage;

  ShowPrediction({
    required this.disease,
    required this.stage,
  });
  _ShowPredictionState createState() => _ShowPredictionState();
}

class _ShowPredictionState extends State<ShowPrediction> {
  bool buttonActive = false;
  String _medicine = "";
  String buttonText = "Medication";

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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width / 7,
                            color: Colors.black26,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Predicted Disease",
                              style: HeaderStyle2,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width / 7,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 50),
                        child: Text(
                          widget.disease,
                          style: HeaderStyle3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width / 3.5,
                            color: Colors.black26,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Stage",
                              style: HeaderStyle2,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: MediaQuery.of(context).size.width / 3.5,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 50),
                        child: Text(
                          widget.stage,
                          style: HeaderStyle3,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.black26,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 50),
                        child: Text(
                          _medicine,
                          style: LabelStyle1,
                        ),
                      ),
                      CustomButton(
                          labelText: buttonText,
                          active: true,
                          onPress: () {
                            if (buttonText == "Home") {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ),
                              );
                            } else {
                              predict();
                            }
                          }),
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

  void predict() async {
    final medsResponse = await ApiCalls.getMedicine(
        disease: widget.disease, stage: widget.stage);
    if (medsResponse.isSuccess) {
      setState(() {
        _medicine = medsResponse.jsonBody.toString();
        buttonText = "Home";
      });
    } else {
      showSnackBar(" Something went wrong", context);
    }
  }
}
