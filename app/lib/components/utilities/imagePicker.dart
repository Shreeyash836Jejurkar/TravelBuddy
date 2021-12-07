import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagePicker extends StatefulWidget {
  @override
  imagePickerState createState() => imagePickerState();
}

class imagePickerState extends State<imagePicker> {
  File image;

  // click image
  imageFrontCamera() async {
    PickedFile img = await ImagePicker().getImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        image = File(image.path);
      });
    }
  }

  // upload image
  imageFromGallery() async {
    PickedFile img = await ImagePicker().getImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: image == null ? Text("no image") : Image.file(image),
          ),
          TextButton(onPressed: imageFrontCamera, child: Text("cam img")),
          TextButton(onPressed: imageFromGallery, child: Text("upl img")),
        ],
      ),
    );
  }
}
