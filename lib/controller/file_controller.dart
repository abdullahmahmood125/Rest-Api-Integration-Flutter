

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class FileController{


  Future<String> getBase64(String imagePath) async {

    File imagefile = File(imagePath); //convert Path to File
    Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
    String base64string = base64.encode(imagebytes); //convert bytes to base64 string
    print(base64string);
    return base64string;

  }

  Future<String> uploadFormDataFile(String imagepath) async{

    String message = "error";
    try{
      String filename = basename(imagepath);
      //filename = image!.path.split('/').last;
      FormData formData = new FormData.fromMap({'file' : await
      MultipartFile.fromFile(imagepath, filename: filename)
      });
      Response response =
      await Dio().post("https://v2.convertapi.com/upload", data: await getBase64(imagepath));
      print("File upload response: $response");
      message =  '${response.statusMessage}';

    }catch(e){
      print(e);
      print('block6 ${e.toString()}');

    }
    return message;
  }

}