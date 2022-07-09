import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../styles.dart';
import '../views/home.dart';

class NavDrawer extends StatefulWidget {
  String profileImg = '';

  NavDrawer({required this.profileImg});

  @override
  _NavDrawerScreen createState() => _NavDrawerScreen();
}

class _NavDrawerScreen extends State<NavDrawer> {
  String _defaultImg = 'assets/images/nav.jpg';
  String _token = "";
  bool _signed = true;

  // getStatus() async {
  //   await Settings.getSigned().then((value) => {_signed = value!});
  //   setState(() {});
  // }

  logOut() async {
    // await Settings.getAccessToken().then((value) => {_token = value!});
    // final response = await ApiCalls.signOut(token: _token);
    // if (response.isSuccess) {
    //   await Settings.setSigned(false);
    //   await Settings.getSigned().then((value) => {_signed = value!});
    //   await Settings.setUserID("");
    //   await Settings.setAccessToken("");
    //   await Settings.setFName("");
    //   await Settings.setLName("");
    //   await Settings.setUserPhone("");
    //   await Settings.setUserEmail("");

    //   setState(() {});

    //   Fluttertoast.showToast(
    //     msg: "Signed out ...",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //   );
    //   Navigator.of(context).pop();
    // } else {
    //   Fluttertoast.showToast(
    //     msg: "Signed out ...",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //   );
    // }
  }

  @override
  void initState() {
    // getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            children: [
              Blur(
                blur: 3.5,
                blurColor: Colors.black,
                child: Container(
                  color: Colors.white,
                  height: 220,
                  width: 310,
                  child: Image.asset(
                    widget.profileImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 80,
                margin: EdgeInsets.only(top: 120, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  child: Image.asset(
                    widget.profileImg,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              Container(
                color: DefaultColor,
                width: double.infinity,
                height: 4,
                margin: EdgeInsets.only(top: 220),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image.asset(
              'assets/icons/home-grey.png',
            ),
            title: Text('Home'),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              )
            },
          ),
          Container(
            child: _signed
                ? GestureDetector(
                    onTap: () => {logOut()},
                    child: Container(
                      margin: const EdgeInsets.only(left: 117, top: 280),
                      child: const Text(
                        "Sign out",
                        style: LogOut,
                      ),
                    ),
                  )
                : const SizedBox(height: 2),
          ),
          GestureDetector(
            child: Container(
              margin: _signed
                  ? const EdgeInsets.only(left: 120, top: 20)
                  : const EdgeInsets.only(left: 120, top: 320),
              child: const Text(
                "Donate",
                style: SeeAllStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
