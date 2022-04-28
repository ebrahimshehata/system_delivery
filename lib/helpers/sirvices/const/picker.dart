import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:file_picker/file_picker.dart';

class Picker{
  static PickedFile? image=null;
  static FilePickerResult? file_result = null;


static void pickerFile()async{
  file_result = await FilePicker.platform.pickFiles();
  if (file_result != null) {
    File file = File("${file_result!.files.single.path}");
  } else {
    // User canceled the picker
  }
}
  static void openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
      image = pickedFile!;
    Navigator.pop(context);
  }

  static void openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );

      image = pickedFile!;

    Navigator.pop(context);
  }
  ///
  static Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: const Text("Choose option",style: TextStyle(
            color: Colors.green),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              const Divider(height: 1,color:Colors.green,),
              ListTile(
                onTap: (){
                  openGallery(context);
                },
                title: const Text("Gallery"),
                leading: const Icon(Icons.account_box,
                  color: Colors.green,),
              ),

              const Divider(height: 1,color: Colors.green,),
              ListTile(
                onTap: (){
                  openCamera(context);
                },
                title: Text("Camera"),
                leading: const Icon(Icons.camera,
                  color: Colors.green,),
              ),
            ],
          ),
        ),);
    });
  }

}