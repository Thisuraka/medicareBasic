import '../../styles.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  String text;
  double width = 330.0;
  double height;
  bool selected;
  bool small;

  CustomCheckbox(
      {required this.text,
      required this.width,
      this.height = 40.0,
      this.small = false,
      this.selected = false});

  @override
  _CustomCheckboxScreen createState() => _CustomCheckboxScreen();
}

class _CustomCheckboxScreen extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          color: Colors.white,
          child: Text(
            widget.text,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: widget.selected ? DefaultColor : Colors.black38,
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
