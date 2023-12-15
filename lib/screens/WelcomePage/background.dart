import 'package:b_im_q/constants.dart';
import 'package:flutter/material.dart';
import '../Login/components/body.dart';
import '../signUp/signUp_screen.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height:size.height,
      width: double.infinity,
      child:Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
            child: Image.asset("assets/images/wallpaper_phone.png",
            width: size.width,
            ),
          ),
          Positioned(
            top: 15,
            right: 0,
            child: IconButton(
              icon: Image.asset("assets/icons/login_signUp.png"),
              iconSize: 50,
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return SignUpScreen();
                      },
                    ),
                );
              },
            )
          ),
          Positioned(
            top: 30,
            left: 0,
            child: Image.asset(
              "assets/icons/LOGO.png",
              width: size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
