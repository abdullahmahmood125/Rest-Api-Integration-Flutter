import 'dart:io';

import 'package:api_integration/controller/file_controller.dart';
import 'package:api_integration/view/widget/item_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Base64Widget extends StatefulWidget {
  const Base64Widget({
    Key? key,
  }) : super(key: key);

  @override
  _Base64WidgetState createState() => _Base64WidgetState();
}

class _Base64WidgetState extends State<Base64Widget> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () async {
        File? image = null;
        var imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(imagePicker != null){
          setState(() {
            image = File(imagePicker.path);
          });
        }

        FileController().uploadFormDataFile(image!.path)
            .then((value) => {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$value'), duration: Duration(milliseconds: 500),))
        });

      },
      child: buildBigButtonContainer('Base64', Color(0xFFBBDEFB)),
    );
  }
}