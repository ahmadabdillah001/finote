import 'package:finote/shared/shared.dart';
import 'package:flutter/material.dart';

class InputFormWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final double width;
  final bool isPassword;
  final Color? color;

  const InputFormWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.width = double.infinity,
    this.isPassword = false,
    this.color
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
        Text(widget.label, style: labelFormTextStyle.copyWith(color: widget.color ?? whiteColor)),
        SpaceHeight(8),
        TextFormField(
          style: labelFormTextStyle.copyWith(color: widget.color ?? whiteColor),
          cursorColor: widget.color ??  whiteColor,
          obscureText: widget.isPassword,
          controller: widget.controller,
          decoration: InputDecoration(
            hintStyle: hintFormTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: widget.color ??  whiteColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: widget.color ??  whiteColor, width: 2),
            ),
            hintText: widget.hint,
          ),
        ),
      ],
    );
  }
}
