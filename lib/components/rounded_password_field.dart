import 'package:b_im_q/components/text_filed_container.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  const RoundedPasswordField({
    super.key, required this.controller,
  });

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText :passwordVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: "Password",
          icon: Icon(Icons.lock,color: kPrimaryColor),
          suffixIcon: IconButton(
            icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off,
          color: kPrimaryColor,),
          //border: InputBorder.none
              onPressed: () {
                setState(
                      () {
                    passwordVisible = !passwordVisible;
                  },
                );
              },
            ),
          alignLabelWithHint: false,
          filled: true,
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
