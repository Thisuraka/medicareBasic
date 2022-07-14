import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:medicare/widgets/customButton.dart';
import '../styles.dart';
import '../utils/helper.dart';
import '../widgets/dialog/loadingDialog.dart';
import '../widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import '../widgets/customAppbar.dart';
import 'addSymptoms.dart';

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
  bool _gen = false;

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
                      "Please select 5 - 10 images",
                      style: LabelStyle1,
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                labelText: "Predict Disease",
                active: buttonActive,
                onPress: () {
                  if (_imageFileList!.length < 5) {
                    showSnackBar("Please select only 5 - 10 images", context);
                  }
                })
          ]),
        ),
      ),
    );
  }

  genList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2 + 50,
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
    );
  }

  void setGen() {
    if (_imageFileList!.isNotEmpty) {
      _gen = true;
    } else {
      _gen = false;
    }
    if (_imageFileList!.length >= 5) {
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
}
