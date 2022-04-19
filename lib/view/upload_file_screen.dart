


import 'package:api_integration/view/widget/Base64Widget.dart';
import 'package:api_integration/view/widget/FormDataWidget.dart';
import 'package:api_integration/view/widget/item_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class UploadFileScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("File Screen"),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Center(
            child: Column(
              children: [
                FormDataWidget(),
                Base64Widget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
