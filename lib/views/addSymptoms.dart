import 'package:medicare/widgets/custom_button.dart';
import 'package:medicare/widgets/custom_checkbox.dart';
import 'package:medicare/widgets/custom_imagePicker.dart';
import 'package:image_picker/image_picker.dart';
import '../styles.dart';
import '../utils/helper.dart';
import '../widgets/dialog/loadingDialog.dart';
import '../widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';

@override
void initState() {}

class AddSymptoms extends StatefulWidget {
  @override
  _AddSymptomsState createState() => _AddSymptomsState();
}

class _AddSymptomsState extends State<AddSymptoms> {
  List<XFile>? _imageFileList = [];
  bool _loaded = false;
  bool _gen = false;

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
                    height: height / 3 + 10,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Button2BorderColor),
                        color: Colors.white),
                    child: symptomsList.isNotEmpty
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: symptomsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 100,
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      symptomsList[index].toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: DefaultColor,
                                          fontFamily: 'Roboto',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    )),
                              );
                            })
                        : const Center(
                            child: Text("No Symptoms"),
                          ),
                  ),
                  Container(
                    width: width - 40,
                    height: height / 3 + 10,
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Button2BorderColor),
                        color: Colors.white),
                    child: symptomsList.isNotEmpty
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: symptomsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 100,
                                child: Card(
                                  elevation: 2,
                                  child: CustomCheckbox(
                                      text: symptomsList[index].toString(),
                                      width: width - 200),
                                ),
                              );
                            })
                        : const Center(
                            child: Text("No Symptoms"),
                          ),
                  ),
                  CustomButton(
                    text: "Add Selected",
                    width: width - 100,
                    onTap: () {
                      //
                    },
                  ),
                ]),
              ),
            )
          : loadingDialog(context),
    );
  }
}
