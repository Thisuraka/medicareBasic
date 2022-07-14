import '../../styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? labelText;
  bool active = false;
  void Function()? onPress;

  CustomButton(
      {required this.labelText, required this.onPress, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: active ? DefaultColor : InactiveColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        onPressed: onPress,
        child: Text(labelText!),
      ),
    );
  }
}
