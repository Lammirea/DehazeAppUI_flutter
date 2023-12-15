import 'package:flutter/material.dart';
import '../constants.dart';

class RememberMeCheck extends StatelessWidget {
  const RememberMeCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CheckboxExample(),
        SizedBox(
          width: 10,
        ),
        Text(
          "Remember me ",
          style: TextStyle(color:Colors.grey),
        ),
      ],
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return kPrimaryColor;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: kPrimaryColor,
      shape: CircleBorder(),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

