import '../../styles.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  TextEditingController controller;
  TextCapitalization textCapitalization;
  TextInputType keyboardType;
  bool readOnly;
  bool enabled;
  int minLine;
  int maxLine;
  TextStyle hintStyle;
  String labelText;
  Icon suffixIcon;
  bool obscureText;
  String? Function(dynamic)? validator;

  CustomTextBox({
    required this.controller,
    required this.labelText,
    required this.suffixIcon,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.enabled = true,
    this.minLine = 1,
    this.maxLine = 1,
    this.hintStyle = HintStyle1,
    this.obscureText = false,
  });

  static InputBorder enabledBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xffDFDFDF),
    ),
  );

  static InputBorder errorBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
      decoration: BoxDecoration(
        color: DefaultColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        style: const TextStyle(fontSize: 16.0),
        maxLines: maxLine,
        minLines: minLine,
        keyboardType: keyboardType,
        autofocus: false,
        textCapitalization: textCapitalization,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Colors.grey[50],
          labelText: labelText,
          labelStyle: LabelStyle1,
          contentPadding: const EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 10.0),
          enabledBorder: enabledBorder,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
          enabled: enabled,
        ),
      ),
    );
  }
}
