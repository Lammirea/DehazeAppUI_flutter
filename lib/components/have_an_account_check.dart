import 'package:flutter/material.dart';
import '../constants.dart';

class HaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const HaveAnAccountCheck({
    super.key,
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(login ? "Don’t have an account? " : "Already have an account ? ",
          style: TextStyle(color:Colors.grey),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Create new" : "Log In",
            style: TextStyle(
                color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}