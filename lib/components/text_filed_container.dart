import 'package:b_im_q/constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:EdgeInsets.symmetric(vertical:15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 3,color: kPrimaryColor),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}