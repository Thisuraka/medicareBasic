import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';
import 'package:medicare/utils/staticData.dart';
import 'package:medicare/views/dashboard.dart';
import 'package:medicare/widgets/customButton.dart';
import '../styles.dart';
import '../utils/helper.dart';
import '../widgets/dialog/loadingDialog.dart';
import '../widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import '../widgets/customAppbar.dart';
import 'addSymptoms.dart';

import '../utils/helper.dart';
import 'package:medicare/api/api_calls.dart';

@override
void initState() {}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final String _profileImg = 'assets/images/avatar.jpg';
  List<XFile>? _imageFileList = [];
  bool buttonActive = false;
  String buttonText = "Select Image";
  bool _gen = false;
  bool isShowDisease = false;
  bool isGoHome = false;
  String disease = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _drawerKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppbarWidget(
          mainTitle: "Check-en",
          leadingImg: true,
          logo: true,
          searchIcon: true,
          drawerKey: _drawerKey,
        ),
      ),
      drawer: NavDrawer(
        profileImg: _profileImg,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: height,
          width: width,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                addImage();
              },
              child: Container(
                width: width,
                height: 92,
                margin: const EdgeInsets.only(right: 20, left: 20),
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Button2BorderColor, width: 1.5),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/addImage.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    const Text("Pick images of symptoms"),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            _gen
                ? genList()
                : Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 2 + 50,
                    child: const Text(
                      "Please select an image",
                      style: LabelStyle1,
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              labelText: buttonText,
              active: buttonActive,
              onPress: () {
                if (isGoHome) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                } else {
                  showDisease();
                }
              },
            ),
          ]),
        ),
      ),
    );
  }

  genList() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 4,
              spacing: 4,
              alignment: WrapAlignment.center,
              children: List.generate(_imageFileList!.length, (index) {
                return Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Button2BorderColor)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(File(_imageFileList![index].path),
                            fit: BoxFit.cover),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          removeImage(index);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 2, top: 2),
                        child: Image.asset('assets/icons/remove.png',
                            width: 15, height: 15, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
        isShowDisease
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Text(
                  disease,
                  textAlign: TextAlign.center,
                  style: HeaderStyle3,
                ),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
              )
      ],
    );
  }

  void setGen() {
    if (_imageFileList!.isNotEmpty) {
      _gen = true;
    } else {
      buttonText = "Select Image";
      _gen = false;
    }
    if (_imageFileList!.length >= 1) {
      buttonActive = true;
    }
    setState(() {});
  }

  Future<void> addImage() async {
    _imageFileList = await Helper.selectImages();
    setGen();
  }

  void removeImage(int index) {
    _imageFileList!.removeAt(index);
    setGen();
  }

  showDisease() {
    if (_imageFileList!.length < 1) {
      showSnackBar("Please select an image", context);
    } else {
      setState(() {
        buttonText = "Preparing";
        buttonActive = false;
      });
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          buttonActive = false;
          buttonText = "Processing";
        });
      }).then((value) => getDisease());
    }
  }

  getDisease() {
    if (disease == "") {
      final _random = new Random();
      disease = diseases[_random.nextInt(diseases.length)];
    }

    setState(() {
      isShowDisease = true;
      buttonText = "Home";
      buttonActive = true;
      isGoHome = true;
    });
  }
}
