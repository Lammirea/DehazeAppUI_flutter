import 'package:flutter/material.dart';

class BackgroundSignUp extends StatelessWidget {
  final Widget child;
  const BackgroundSignUp({
    super.key,
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/icons/circle_right_corner.png")
          ),
          child,
        ],
      ),
    );
  }
}
