import 'package:auto_size_text/auto_size_text.dart';
import 'package:b_im_q/components/RoundedButton.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_input_field.dart';
import '../../../constants.dart';
import 'BackgroundReserPwd.dart';

class BodyresetPwd extends StatefulWidget {
  const BodyresetPwd({
    super.key,
  });

  @override
  State<BodyresetPwd> createState() => _BodyresetPwdState();
}

class _BodyresetPwdState extends State<BodyresetPwd> {
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return BackgroundResetPwd(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Text("Reset Password",
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
        SizedBox(height: size.height*0.06),
        SizedBox(
          width: 240,
          height: 40,
          child: AutoSizeText("An email with the reset link will be sent to you",
          textAlign: TextAlign.center,
          style: TextStyle(color:Colors.grey,fontSize: 16),
          ),
        ),
        SizedBox(height: size.height*0.04),
        RoundedInputField(hintText: "Your email",
          icon: Icons.mail_outline,
          controller: pwdController,),
        SizedBox(height: size.height*0.04),
        RoundedButtonLogSign(text: "Reset", press: (){})
      ],
    ),);
  }
}

