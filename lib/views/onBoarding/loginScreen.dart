import 'package:medicare/widgets/customButton.dart';
import 'package:medicare/widgets/customTextbox.dart';
import 'package:medicare/widgets/searchBar.dart';

import '../../widgets/dialog/loadingDialog.dart';
import '../dashboard.dart';
import '../home.dart';
import '../../styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../utils/helper.dart';

@override
void initState() {}

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailAddress = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool buttonActive = false;

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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextBox(
                          controller: _emailAddress,
                          labelText: "Please enter email",
                          suffixIcon: const Icon(
                            Icons.account_circle,
                            color: DefaultColor,
                            size: 24,
                          ),
                        ),
                        CustomTextBox(
                          controller: _password,
                          keyboardType: TextInputType.visiblePassword,
                          labelText: "Please enter password",
                          suffixIcon: const Icon(
                            Icons.key,
                            color: DefaultColor,
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            labelText: "Login ",
                            active: true,
                            onPress: () {
                              loginRegisterCheck();
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginRegisterCheck() {
    // if (_emailAddress.text == "checken@gmail.com" &&
    //     _password.text == "123456") {
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (context) => HomeScreen(),
    //     ),
    //   );
    // } else {
    //   showSnackBar("Invalid Login", context);
    // }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Dashboard(),
      ),
    );
  }
}
