import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';

class InputFormWidget extends StatefulWidget {
  TextEditingController controller;
  String label;
  String hint;
  double width;
  bool isPassword;

  InputFormWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.width = double.infinity,
    this.isPassword = false,
  });

  @override
  State<InputFormWidget> createState() => _InputFormWidgetState();
}

class _InputFormWidgetState extends State<InputFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: labelFormTextStyle),
        SpaceHeight(8),
        TextFormField(
          style: labelFormTextStyle,
          cursorColor: whiteColor,
          obscureText: widget.isPassword,
          controller: widget.controller,
          decoration: InputDecoration(
            hintStyle: hintFormTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: whiteColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: whiteColor, width: 2),
            ),
            hintText: widget.hint,
          ),
        ),
      ],
    );
  }
}
