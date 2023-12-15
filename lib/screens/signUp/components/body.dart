import 'package:b_im_q/backend/CRUD.dart';
import 'package:b_im_q/components/RoundedButton.dart';
import 'package:b_im_q/components/have_an_account_check.dart';
import 'package:b_im_q/components/rounded_input_field.dart';
import 'package:b_im_q/components/rounded_password_field.dart';
import 'package:b_im_q/screens/Login/login_screen.dart';
import 'package:b_im_q/screens/signUp/components/backgroundSign.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../backend/users.dart';
import 'package:email_validator/email_validator.dart';


class Body extends StatefulWidget {
  const Body({
    Key? key,
  }): super(key : key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController loginController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<Users> users;
    final DioClient _client = DioClient();

    return BackgroundSignUp(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: size.height * 0.12),
        Text("Create Account",
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_errorMessage, style: TextStyle(color: Colors.red)),
        ),
        RoundedInputField(
          hintText: "Your login",
          icon : Icons.person_2_outlined,
          controller: loginController,
        ),
        RoundedInputField(
          //сделать проверку на идентичный email
          hintText: "Your email",
          icon: Icons.email_outlined,
          controller: emailController),
        RoundedPasswordField(controller: pwdController,),
        RoundedButtonLogSign(text: "Sign up", press: () async{
          var username = loginController.text;
          var email = emailController.text;
          var password = pwdController.text;
          validateEmail(email);
          await _client.signUpUser(username: username, email: email, password: password).then((value){
            Navigator.push(context, MaterialPageRoute(
                      builder: (context){return Login();}
                   ));
          }).catchError((err) {_errorMessage = err;});
          // if (dataUser != null){
          //   Navigator.push(context, MaterialPageRoute(
          //       builder: (context){return Login();}
          //   ));
          // }
          // dataUser.catchError((err){
          //   if(err == 400){
          //     _errorMessage = err;
          //   }
          // },);
          if(kDebugMode){
            print("username: "+ username + "\temail: "+ email + "\tpassword: "+ password);
          }
        }),
        HaveAnAccountCheck(login: false, press: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context){return Login();}
          ));
        })
      ],
    ),);
  }
  String validateEmail(String val) {
    if(val.isEmpty){
        _errorMessage = "Email can not be empty";
    }else if(!EmailValidator.validate(val, true)){
        _errorMessage = "Invalid Email Address";
    }else{
        _errorMessage = "";
    }
    return _errorMessage;
  }
}

