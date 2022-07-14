import '../../styles.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  TextEditingController controller;
  TextCapitalization textCapitalization;
  TextInputType keyboardType;
  bool readOnly;
  bool enabled;
  int minLine;
  int maxLine;
  String hint;
  TextStyle hintStyle;
  String labelText;
  Icon prifixIcon;
  bool obscureText;
  String? Function(dynamic)? validator;

  SearchBox({
    required this.controller,
    required this.hint,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.enabled = true,
    this.minLine = 1,
    this.maxLine = 1,
    this.hintStyle = HintStyle1,
    required this.labelText,
    required this.prifixIcon,
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
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0.0),
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
            filled: true,
            fillColor: Colors.grey[50],
            hintText: hint,
            hintStyle: HintStyle1,
            labelText: labelText,
            labelStyle: LabelStyle1,
            contentPadding: const EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 10.0),
            enabledBorder: enabledBorder,
            // focusedBorder: enabledBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            enabled: enabled,
          ),
        ),
      ),
      Container(
        width: 35,
        height: 35,
        margin: const EdgeInsets.only(left: 325, top: 7),
        child: prifixIcon,
      )
    ]);
  }
}
