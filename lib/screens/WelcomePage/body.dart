
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:b_im_q/screens/WelcomePage/background.dart';
import 'package:b_im_q/components/RoundedButton.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:open_file/open_file.dart';



class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _pickFile() async {

    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;

    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    //Future<Users?>? users;
    Size size = MediaQuery.of(context).size;
    //This size provide us total height and width of screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          SizedBox(
          width: 300,
          height: 140,
          child: AutoSizeText("Remove haze from your images or videos",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
           ),
            SizedBox(height: size.height * 0.05),
            RoundedButtonClear(
              text: "Clear image",
              press: (){
                _pickFile();
              },
            ),
            RoundedButtonClear(
              text: "Clear video",
              press: (){
              },
            ),
          ],
        ),
      ),
    );
  }
}




