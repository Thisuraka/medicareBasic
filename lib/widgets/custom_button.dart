import '../../styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String text;
  double width = 330.0;
  double height;
  Function()? onTap;

  CustomButton({
    required this.text,
    required this.width,
    required this.onTap,
    this.height = 45.0,
  });

  @override
  _CustomButtonScreen createState() => _CustomButtonScreen();
}

class _CustomButtonScreen extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: widget.width,
          height: widget.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Text(
              widget.text,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: DefaultColor,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
