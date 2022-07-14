import 'package:medicare/utils/settings.dart';
import 'package:medicare/views/onBoarding/loginScreen.dart';

import '../../styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import '../home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? signed = false;
  @override
  void initState() {
    super.initState();
    checkNavigation();
  }

  checkNavigation() async {
    signed = await Settings.getSigned() == null
        ? false
        : (await Settings.getSigned())!;

    Future.delayed(const Duration(seconds: 1), () {
      if (signed!) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Pulse(
                  preferences: const AnimationPreferences(
                      offset: Duration(seconds: 1),
                      autoPlay: AnimationPlayStates.Loop),
                  child: Container(
                    alignment: const Alignment(0.0, 0.0),
                    child: Container(
                      margin: const EdgeInsets.all(40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/CheckenLogo.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
