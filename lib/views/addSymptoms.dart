import 'package:medicare/widgets/customButton.dart';
import 'package:medicare/api/api_calls.dart';
import 'package:medicare/api/api_caller.dart';
import '../styles.dart';
import '../utils/helper.dart';
import '../utils/staticData.dart';
import '../widgets/dialog/loadingDialog.dart';

import 'package:flutter/material.dart';
import '../widgets/customAppbar.dart';

@override
void initState() {}

class AddSymptoms extends StatefulWidget {
  @override
  _AddSymptomsState createState() => _AddSymptomsState();
}

class _AddSymptomsState extends State<AddSymptoms> {
  bool _loaded = false;
  bool _gen = false;
  bool buttonActive = false;
  List<dynamic> finalSymptomList = [];

  @override
  void initState() {
    _loaded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppbarWidget(
          mainTitle: "MediCare",
          leadingImg: false,
          logo: false,
          searchIcon: true,
        ),
      ),
      body: _loaded
          ? GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: width,
                height: height,
                child: Column(children: [
                  Container(
                    width: width - 40,
                    height: height - 300,
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Button2BorderColor),
                        color: Colors.white),
                    child: symptomsList.isNotEmpty
                        ? ListView(
                            children: symptomsList.keys.map((String key) {
                              return CheckboxListTile(
                                title: Text(key),
                                autofocus: false,
                                activeColor: DefaultColor,
                                checkColor: Colors.white,
                                selected: symptomsList[key]!,
                                value: symptomsList[key]!,
                                onChanged: (value) {
                                  if (value!) {
                                    if (finalSymptomList.length < 9) {
                                      setState(() {
                                        symptomsList[key] = value;
                                      });
                                      finalSymptomList
                                          .add(symptomsListForBackend[key]);
                                    } else {
                                      showSnackBar(
                                          "Please select only 5 - 10 symptoms",
                                          context);
                                    }
                                  } else {
                                    setState(() {
                                      symptomsList[key] = value;
                                    });
                                    finalSymptomList
                                        .remove(symptomsListForBackend[key]);
                                  }
                                  if (finalSymptomList.length < 9 &&
                                      finalSymptomList.length > 4) {
                                    setState(() {
                                      buttonActive = true;
                                    });
                                  } else {
                                    setState(() {
                                      buttonActive = false;
                                    });
                                  }
                                },
                              );
                            }).toList(),
                          )
                        : const Center(
                            child: Text("No Symptoms"),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      labelText: "Predict",
                      active: buttonActive,
                      onPress: () {
                        if (buttonActive) {
                          predict();
                        } else {
                          showSnackBar(
                              "Please select 5 - 10 symptoms", context);
                        }
                      })
                ]),
              ),
            )
          : loadingDialog(context),
    );
  }

  void predict() async {
    final response =
        await ApiCalls.predictMedicineFromSymptom(symptoms: finalSymptomList);
    print(response.apiStatus);
  }
}
