import 'dart:async';

import 'package:b_im_q/components/text_filed_container.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  const RoundedInputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
  });

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          icon: Icon(widget.icon, color:kPrimaryColor),
          hintText: widget.hintText,
          border: InputBorder.none),
      validator: (val) => val!.isEmpty ? '${widget.hintText} Required' : null,
    ),
    );
  }
}
