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

    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          key: _drawerKey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: CustomAppbarWidget(
              mainTitle: "MediCare",
              leadingImg: true,
              logo: false,
              searchIcon: true,
              drawerKey: _drawerKey,
            ),
          ),
          drawer: NavDrawer(
            profileImg: _profileImg,
          ),
          body: _loaded
              ? Container(
                  width: width,
                  height: height,
                  child: Column(children: [
                    GestureDetector(
                      onTap: addImage,
                      child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: double.infinity,
                        color: Colors.amber,
                        height: 100,
                        child: CustomImagePicker(
                            _imageFileList, addImage, removeImage,
                            gen: _gen),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Generate Symptoms",
                      width: width - 100,
                      onTap: () {
                        //
                      },
                    ),
                    Container(
                      width: width - 40,
                      height: height / 2 + 20,
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
                    CustomButton(
                      text: "Add Symptoms",
                      width: width - 100,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddSymptoms(),
                          ),
                        );
                      },
                    ),
                  ]),
                )
              : loadingDialog(context),
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
