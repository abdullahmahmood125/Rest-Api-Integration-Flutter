import 'dart:io';

import 'package:api_integration/controller/file_controller.dart';
import 'package:api_integration/view/widget/item_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class FormDataWidget extends StatefulWidget {
  const FormDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  _FormDataWidgetState createState() => _FormDataWidgetState();
}

class _FormDataWidgetState extends State<FormDataWidget> {

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
      child: buildBigButtonContainer('Form-Data', Color(0xFFC8E6C9)),
    );
  }
}