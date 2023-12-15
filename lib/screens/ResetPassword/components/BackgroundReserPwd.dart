import 'package:flutter/material.dart';

class BackgroundResetPwd extends StatelessWidget {
  final Widget child;
  const BackgroundResetPwd({
    super.key, required this.child,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top:0,
            left:0,
            child: Image.asset("assets/icons/circles_left_corner.png"),
          ),
          Positioned(
              top:0,
              right:0,
              child: Image.asset("assets/icons/circle_right_up_corner.png")),
          Positioned(
              bottom: 90,
              left: 0,
              child: Image.asset("assets/icons/circle_left_down.png")
          ),
          child,
        ],
      ),
    );
  }
}

