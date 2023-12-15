import 'package:flutter/material.dart';
import 'package:b_im_q/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color,textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child:TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: kPrimaryColor,
          ),
          onPressed: press,
          child: Text(text,
            style:TextStyle(color:textColor,
                fontWeight: FontWeight.normal,
                fontFamily: 'Open Sans',
                fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class RoundedButtonLogSign extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color,textColor;

  const RoundedButtonLogSign({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child:TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: kPrimaryColor,
          ),
          onPressed: press,
          child: Text(text,
            style:TextStyle(color:textColor,
                fontWeight: FontWeight.normal,
                fontFamily: 'Open Sans',
                fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class RoundedButtonClear extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color,textColor;

  const RoundedButtonClear({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child:TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: kPrimaryColor,
          ),
          onPressed: press,
          child: Text(text,
            style:TextStyle(color:textColor,
                fontWeight: FontWeight.normal,
                fontFamily: 'Open Sans',
                fontSize: 24),
          ),
        ),
      ),
    );
  }
}