import 'package:b_im_q/backend/users.dart';
import 'package:b_im_q/components/RoundedButton.dart';
import 'package:b_im_q/components/rounded_input_field.dart';
import 'package:b_im_q/components/text_filed_container.dart';
import 'package:b_im_q/constants.dart';
import 'package:b_im_q/screens/Login/components/background.dart';
import 'package:b_im_q/screens/signUp/signUp_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../backend/CRUD.dart';
import '../../../components/RememberMeCheck.dart';
import '../../../components/have_an_account_check.dart';
import '../../../components/rounded_password_field.dart';
import '../../ResetPassword/ResetPwd_screen.dart';
import '../../main_screen.dart';

class body extends StatefulWidget {
  const body({
    Key? key,
  }): super(key : key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  TextEditingController loginController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Users dataUser;
    final DioClient _client = DioClient();

    return Background(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Welcome back!",
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 36,
          ),
        ),
        SizedBox(height: size.height * 0.07),
        RoundedInputField(
          hintText: "Your login",
          icon: Icons.person_2_outlined,
          controller: loginController,
        ),
        RoundedPasswordField(controller: pwdController,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){Navigator.push(
                context, MaterialPageRoute(
                builder: (context){
                  return ResetPwd();
                },),
              );},
            child: Text(
              " Forgot password?",
              style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
            ),
          ],
        ),
        RoundedButtonLogSign(text: "Log in", press: () async {
          var username = loginController.text;
          var pwd = pwdController.text;
          isLogged = await _client.dioLogin(username: username, password: pwd);
          if(isLogged == true){
            //сделать переброс на главную страницу
             String? result = await _client.DioGetUserData();
             if(kDebugMode){
               print(result);
             }
             Navigator.push(
               context, MaterialPageRoute(
               builder: (BuildContext context){
                 return MainScreen();
               },),
             );
          }
          },
        ),
        SizedBox(height: size.height * 0.03),
        HaveAnAccountCheck(press: (){
          Navigator.push(
              context, MaterialPageRoute(
              builder: (context){
                return SignUpScreen();
              },),
          );
          },)
      ],
    ));
  }
}






